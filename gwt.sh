_gwt_jump_to_default() {
  local default_branch
  default_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@' 2>/dev/null)
  local worktree_path=""

  if [ -n "$default_branch" ]; then
    worktree_path=$(git worktree list | grep "\[$default_branch\]" | awk '{print $1}')
  fi

  if [ -n "$worktree_path" ]; then
    echo "Jumping to default branch ('$default_branch') worktree..."
    cd "$worktree_path"
  else
    echo "Default branch worktree not found. Jumping to the main repository folder."
    cd "$(git rev-parse --show-toplevel)"
  fi
}

# git worktree manager
# Usage:
#   gwt              - Interactively cd into any worktree using fzf.
#   gwt add <branch> - Create a new worktree and jump into it.
#   gwt main         - Jump to the default branch worktree (or the main repo folder).
#   gwt <branch>     - Jump directly to the worktree for the specified branch.
#   gwt remove       - Interactively select and remove a worktree.
gwt() {
  if [ -z "$1" ]; then
    local fzf_opts="--height 40% --layout=reverse --preview 'git -C {1} --no-pager status'"
    local worktree_line
    worktree_line=$(git worktree list | eval fzf "$fzf_opts")

    if [ -n "$worktree_line" ]; then
      local worktree_path
      worktree_path=$(echo "$worktree_line" | awk '{print $1}')
      cd "$worktree_path"
    fi
    return
  fi

  case "$1" in
    add)
      local branch_to_add="$2"
      if [ -z "$branch_to_add" ]; then
        echo "Error: Please specify a branch name to create a worktree from." >&2; return 1
      fi
      local current_folder_name
      current_folder_name=$(basename "$(pwd)")
      local sanitized_branch_name
      sanitized_branch_name=$(echo "$branch_to_add" | sed 's/\//_/g')
      local new_worktree_path="../${current_folder_name}_${sanitized_branch_name}"

      if [ -e "$new_worktree_path" ]; then
        echo "Error: A directory already exists at '$new_worktree_path'." >&2; return 1
      fi

      echo "Creating worktree for branch '$branch_to_add' at '$new_worktree_path'..."
      if git worktree add "$new_worktree_path" "$branch_to_add"; then
        cd "$new_worktree_path"
      fi
      ;;

    main|master)
      _gwt_jump_to_default
      ;;

    remove)
      local fzf_opts="--height 40% --layout=reverse --preview 'git -C {1} --no-pager status'"
      printf "Select a worktree to REMOVE:\n"
      local worktree_line
      worktree_line=$(git worktree list | eval fzf "$fzf_opts")

      if [ -n "$worktree_line" ]; then
        local worktree_path_to_remove
        worktree_path_to_remove=$(echo "$worktree_line" | awk '{print $1}')

        printf "Permanently remove worktree '%s'? [y/N] " "$worktree_path_to_remove"
        read -r REPLY

        case "$REPLY" in
          [Yy]*)
            local common_dir
            common_dir=$(git -C "$worktree_path_to_remove" rev-parse --git-common-dir 2>/dev/null)
            local main_repo_path
            if [ -n "$common_dir" ]; then
              main_repo_path=$(cd "$common_dir/.." && pwd)
            else
              main_repo_path=$(git rev-parse --show-toplevel)
            fi

            cd "$main_repo_path" || { echo "Error: failed to cd to main repository at '$main_repo_path'." >&2; return 1; }

            echo "Removing worktree..."
            git worktree remove "$worktree_path_to_remove"

            echo "Jumping to main repository folder: $main_repo_path"
            ;;
          *) echo "Removal cancelled." ;;
        esac
      fi
      ;;

    *)
      local branch_name="$1"
      local worktree_path_for_branch
      worktree_path_for_branch=$(git worktree list | grep "\[$branch_name\]" | awk '{print $1}')

      if [ -n "$worktree_path_for_branch" ]; then
        echo "Jumping to worktree for branch '$branch_name'..."
        cd "$worktree_path_for_branch"
      else
        echo "Error: No worktree found for branch '$branch_name'." >&2; return 1
      fi
      ;;
  esac
}
