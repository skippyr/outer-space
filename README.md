# Outer Space
## About
A theme for the ZSH shell with an outer space thematic.
![](preview.png)

It shows you:
-   Your user and host names.
-   Your current directory abbreviating parent directories.
-   If inside a Git repository, the branch and if there are changes to be
    commited.

## Installation
### Dependencies
-   git
-   A Nerd Font's font.

### Procedures
-   Clone this repository.
```bash
git\
  clone --depth=1 https://github.com/skippyr/outer-space\
  ~/.local/share/zsh/themes/outer-space
```

-   Add the following source rule to your `~/.zshrc` file. Ensure to not source
    other theme.

```bash
source ~/.local/share/zsh/themes/outer-space/outer-space.zsh-theme
```

-   Reopen ZSH.

## Copyright
This software is under the MIT license. A copy of the license is bundled with
the source code.
