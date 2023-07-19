# Outer Space

## Description

A theme for the ZSH shell with an outer space thematic.

![](images/preview.png)

> **Note**
>
> The theme may look different in your setup as its appearance depends of what
> colors and font you are using for your terminal emulator. Use the preview as
> just a reference.
>
> Theme used for terminal emulator is [Flamerial](https://github.com/skippyr/flamerial).

Here is the description of its design:
-	Your host and user names will appear concatenated with an `@`.
-	Sourced virtual environments will appear preceded by a spaceship icon.
-	Your current directory will appear abbreviated: for parent directories, only
	their initials will be used. It will be preceded by a planet icon.
-	If inside a Git repository, the current branch will appear preceded by a flag
	icon. If there are changes to be commited a star symbol will appear beside
	that icon.

## Installation

### Dependencies

The following dependencies must be installed to run this software:

| Dependency | Description |
|-|-|
| `git` | Required to retrive information about Git repositories. |
| A [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases)' font | Provides the required pretty symbols. |

### Manual Procedures

Use the following instructions to install this theme manually.

-	Run the following command inside of a terminal emulator to install the theme.
```bash
git clone --depth=1 https://github.com/skippyr/outer-space\
                    ~/.local/share/zsh/themes/outer-space &&
echo "source ~/.local/share/zsh/themes/outer-space/outer-space.zsh-theme" >>\
     ~/.zshrc
```

-	Reopen the terminal emulator to load the theme.

### Procedures With OhMyZSH

Use the following instructions to install this theme for OhMyZSH.

-	Run the following command inside of a terminal emulator to install the theme.

```bash
git clone --depth=1 https://github.com/skippyr/outer-space\
                    ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/outer-space
```

-	Change the value of the `ZSH_THEME` variable in your ZSH configuration file,
	`~/.zshrc`, to use the theme:

```bash
ZSH_THEME=outer-space/outer-space
```

-	Reopen the terminal emulator to load the theme.

## Support

Report issues, questions and suggestion through the [issues tab](https://github.com/skippyr/outer-space/issues).

## Copyright

This software is distributed under the MIT License. A copy of the license is
bundled with the source code.

Copyright (c) 2023, Sherman Rofeman. MIT license.
