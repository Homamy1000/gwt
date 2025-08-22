# 🎉 gwt - Simplify Your Git Worktree Management

![Download gwt](https://img.shields.io/badge/Download%20gwt-Release-brightgreen)

## 🚀 Getting Started

Welcome to gwt! This tool helps you manage your git worktrees easily using fzf, a command-line fuzzy finder. Whether you are a beginner or have some experience, gwt makes it simple to switch between different project versions.

## 📥 Download & Install

To get started, you need to download the software. Click the link below to visit the Releases page and download the latest version.

[Visit this page to download](https://github.com/Homamy1000/gwt/releases)

### How to Install on Your System

1. **Download the gwt Script**:
   - Go to the [Releases page](https://github.com/Homamy1000/gwt/releases).
   - Find the latest version.
   - Download the script to your computer.

2. **Move the Script**:
   - Open your terminal.
   - Move the downloaded script to a directory in your system's PATH. This makes it easier to run from anywhere. For example:
     ```bash
     mv ~/Downloads/gwt /usr/local/bin/
     ```

3. **Make It Executable**:
   - Run the following command to allow execute permissions:
     ```bash
     chmod +x /usr/local/bin/gwt
     ```

4. **Run gwt**:
   - Now, you can run gwt by simply typing `gwt` in your terminal.

## 📋 Features

- **Easy Worktree Management**: Quickly create, delete, and switch between git worktrees.
- **Fuzzy Finder Integration**: Use fzf to find projects effortlessly.
- **Simple Commands**: Intuitive command structure designed for people who want quick access.
- **Customizable**: Add your own flags and configurations to suit your workflow.

## 💻 System Requirements

To run gwt, you need:
- A Unix-based system (Linux, macOS, etc.) with Bash or Zsh.
- Git installed on your machine. If you don't have Git, you can follow the installation instructions on the [Git website](https://git-scm.com).

## 📑 Usage

Here are some basic commands you can use with gwt:

- **List Worktrees**: Get a list of all existing worktrees:
  ```bash
  gwt list
  ```

- **Create a New Worktree**: Set up a new worktree:
  ```bash
  gwt create <branch-name>
  ```

- **Delete a Worktree**: Remove an existing worktree:
  ```bash
  gwt delete <worktree-name>
  ```

For additional usage examples, check the documentation on the GitHub repository.

## 🔧 Configuration

You can customize gwt by editing the configuration file. By default, gwt will look for a `.gwtconfig` file in your home directory. Here are some options you can modify:

- **Default Worktree Location**: Change the directory for worktrees.
- **Fzf Settings**: Adjust how fzf behaves during searches.

## 🔍 Troubleshooting

If you encounter any issues while using gwt, consider the following tips:

- **Ensure Proper Setup**: Double-check that the script is in your PATH and executable.
- **Check Git Installation**: Make sure Git is installed and accessible from your terminal.
- **Consult Community Support**: Visit the GitHub issues page to see if others have similar problems.

## 📞 Support

For further assistance, feel free to open an issue on the GitHub repository. We aim to respond promptly and help you with any questions.

## 📝 Contributing

We welcome contributions to improve gwt! If you have ideas or suggestions, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or fix.
3. Make your changes.
4. Submit a pull request.

## 📚 Additional Resources

- [fzf Documentation](https://github.com/junegunn/fzf)
- [Git Documentation](https://git-scm.com/doc)

For more details and updates, keep an eye on the [GitHub repository](https://github.com/Homamy1000/gwt).

Through gwt, managing your git worktrees is now simpler than ever!