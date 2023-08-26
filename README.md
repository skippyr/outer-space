# Outer Space
## About
This repository contains the source code of Outer Space, a theme for the ZSH shell with an outer space thematic and that uses a powerline style.

![](preview.webp)

Note: this theme uses your terminal emulator's colors, so they may look different in your setup.

In the prompt, you will find:
- Your host and user names.
- If you have sourced a virtual environment, its base name.
- Your current directory with parent directories abbreviated by their initials.
- If inside a Git repository, the active branch and if it is dirty.

## Installation
### Dependencies
The following dependencies must be installed to install and run this theme.

- `ZSH`: this is the shell this theme applies on.
- `git`: it will be used to both clone this repository and to get info about your repositories to show in the prompt.
- [A Nerd Font's font](https://www.nerdfonts.com/font-downloads): it provides the pretty symbols used in the theme.

### Procedures
Using a terminal emulator, follow these steps:

- Clone this repository using `git`.

```bash
git clone --depth 1 https://github.com/skippyr/outer-space\
~/.local/share/zsh/themes/outer-space
```

- Add the following source command to your `~/.zshrc` file. Ensure to not source any other theme to avoid conflicts.

```bash
source ~/.local/share/zsh/themes/outer-space/outer-space.zsh-theme
```

- Open a new ZSH session. The theme should now be applied.

## Support
Report issues, questions and suggestions through its [issues page](https://github.com/skippyr/outer-space/issues).

## Copyright
This software is under the MIT license. A copy of the license is bundled with the source code.
