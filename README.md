# Outer Space

## About

A theme for the ZSH shell with an outer space thematic.

![](preview.png)

> **Note**
>
> The theme may look different from the preview in your setup, as its
> appeareance also depends on your terminal emulator's theme and font. The
> theme used is [Flamerial](https://github.com/skippyr/flamerial).

### Features

These are the features this theme brings on:

-   It shows your user and host names.
-   It shows the name of sourced virtual environment.
-   It shows your current directory path abbreviating parent directories by
    their initials.
-   If inside a Git repository, it shows the name of the branch and if there
    are changes to be commited.

## Installation

### Dependencies

This software requires that the following dependencies are installed to run
properly:

| Dependency | Description |
|-|-|
| `git` | required to provide support to Git repositories. | 
| [A Nerd Font's font](https://www.nerdfonts.com/font-downloads) | provides the required pretty symbols. |

### Procedures

Using a terminal emulator, follow these steps:

-   Clone this repository.

```bash
git\
    clone --depth=1 https://github.com/skippyr/outer-space\
    ~/.local/share/zsh/themes/outer-space
```

-   Add the following source rule to your `~/.zshrc` file. Ensure that you are
    not sourcing any other theme to do not cause conflicts.

```bash
source ~/.local/share/zsh/themes/outer-space/outer-space.zsh-theme
```

-   Reopen your terminal emulator to reload your ZSH session in order to load
    the theme.

## Uninstallation

Using a terminal emulator, follow these steps:

-   Remove the theme's directory.

```bash
rm -rf ~/.local/share/zsh/themes/outer-space
```

-   Remove the source rule that you have written in the `~/.zshrc` file during
    the installation.
-   Reopen your terminal emulator to reload your ZSH session in order to load
    the default theme.

## Support

Report issues, questions or suggestions through the [issues tab](https://github.com/skippyr/outer-space/issues).

## Copyright

This software is licensed under the MIT License. A copy of the license is
bundled with the source code.

Copyright (c) Sherman Rofeman. MIT license.
