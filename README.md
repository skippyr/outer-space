# Outer Space

## Starting Point

The Outer Space project is a dual-line theme for the ZSH shell with an outer
space thematic and powerline style.

This theme can be setup with a series of terminal emulators, themes and
wallpapers. You can use following preview as a source of inspiration and
reference to see what it can look like:

![](./images/preview.png)

> In this preview, the Outer Space theme  was used within the [Kitty terminal emulator](https://github.com/kovidgoyal/kitty)
with the [Dracula theme](https://github.com/kovidgoyal/kitty-themes/blob/master/themes/Dracula.conf).
Font used is JetbrainsMono Nerd Font. Wallpaper is [Blue and orange galaxy illustration by Miriam Espacio](https://unsplash.com/photos/K4EUCv5vNc0) from Unsplash.

## Features


* Your current user and hostname.
* The name of sourced virtual environments.
* Your current directory path abbreviated.
* If inside a Git repository, the name of the current branch and if has changes
  to be commited.

## Dependencies

This theme has some dependencies that you need to download before installing it.

* git

    This is the terminal utility used to obtain information about your Git
    repositories.

* A font patched by the Nerd Fonts project and an emojis font, like [Noto Emoji](https://fonts.google.com/noto/specimen/Noto+Emoji).

    These fonts provides all pretty symbols used in this theme.

## Installation

You can install this theme in multiple ways, use the one that suits you best.

### Manually

* Run the following command to install the theme at
  `~/.local/share/zsh/themes/outer_space`.

    ```bash
    git clone --depth=1 https://github.com/skippyr/outer_space ~/.local/share/zsh/themes/outer_space &&
    echo "source \"${HOME}/.local/share/zsh/themes/outer_space/outer_space.zsh-theme\"" >> ~/.zshrc
    ```

* Reopen your terminal emulator.

### Within OhMyZSH

* Install the theme in OhMyZSH custom themes' directory.

    ```bash
    git clone --depth=1 https://github.com/skippyr/outer_space ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/outer_space
    ```

* Change the value of the `ZSH_THEME` variable in your ZSH configuration file,
  `~/.zshrc`, to use the theme.

    ```bash
    ZSH_THEME="outer_space/outer_space"
    ```

* Reopen your terminal emulator.

## Issues And Contributions

Learn how to report issues and contribute to this project by reading its
[contributions guidelines](https://skippyr.github.io/materials/pages/contributions_guidelines.html).

## License

This project is released under the terms of the MIT license. A copy of the
license is bundled with the source code.

Copyright (c) 2023, Sherman Rofeman. MIT license.

