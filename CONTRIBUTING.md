# Contributing to Tmux Scroll Setup

First off, thank you for considering contributing to Tmux Scroll Setup! 🎉

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates.

When you are creating a bug report, please include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples**
- **Describe the behavior you observed**
- **Explain which behavior you expected to see instead**
- **Include screenshots if possible**
- **Include your tmux version**: `tmux -V`
- **Include your OS**: `uname -a`

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

- **Use a clear and descriptive title**
- **Provide a detailed description of the suggested enhancement**
- **Provide specific examples to demonstrate the steps**
- **Describe the current behavior** and **explain the behavior you expected**
- **Explain why this enhancement would be useful**

### Pull Requests

1. Fork the repo
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test your changes thoroughly
5. Commit your changes (`git commit -m 'Add some amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

#### Pull Request Guidelines

- **Keep changes focused** - One feature/fix per PR
- **Update documentation** - If you change functionality, update the README
- **Test thoroughly** - Make sure your changes work
- **Follow the existing style** - Keep consistency with the codebase
- **Write clear commit messages** - Explain what and why

## Styleguides

### Git Commit Messages

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally after the first line

Examples:
```
Add mouse scroll support for ttyd
Fix clipboard integration on macOS
Update README with troubleshooting tips
```

### Configuration File Style

- Use comments to explain non-obvious settings
- Group related settings together
- Keep lines under 80 characters when possible
- Use consistent indentation (spaces, not tabs)

### Documentation Style

- Use clear, concise language
- Include code examples where helpful
- Use proper markdown formatting
- Keep sections organized and easy to navigate

## Testing

Before submitting a pull request, please test your changes:

```bash
# Test basic functionality
tmux new -s test
seq 1 1000
# Try scrolling with mouse and keyboard

# Test the installation script
./install.sh

# Run the test script
./test-tmux-scroll.sh
```

## Project Structure

```
tmux-scroll-setup/
├── README.md                 # Main documentation
├── .tmux.conf               # Main tmux configuration
├── install.sh               # Installation script
├── test-tmux-scroll.sh      # Test script
├── tmux-cheatsheet.md       # Quick reference
├── LICENSE                  # MIT License
├── CHANGELOG.md            # Version history
└── CONTRIBUTING.md         # This file
```

## Questions?

Feel free to open an issue with your question or reach out to the maintainers.

## Recognition

Contributors will be recognized in the README and release notes.

Thank you for contributing! 🙏
