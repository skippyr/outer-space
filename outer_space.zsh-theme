# Enables ZSH prompt substitution.
#
# This make it substitute variables and functions in the prompt variables, but
# they need to be defined using single quotes for it to work.
setopt promptsubst
# Prevents the default changes made to the prompt when sourcing a virtual
# environment.
export VIRTUAL_ENV_DISABLE_PROMPT="1"

# To avoid conflicts with possible user defined functions, all functions defined
# in this theme use the "outer_space::" prefix.
#
# They might also use an underline character (_) at their start to make them
# harder to find when using a regular tab completition.

# If using a virtual environment, prints its base name.
function _outer_space::print_venv {
  typeset -r venv=${VIRTUAL_ENV##*/}
  [[ -n ${venv} ]] &&
  echo "%K{yellow}%F{black} 󱎃 ${venv} %K{red}%F{yellow}%F{black}" ||
  echo "%K{red}%F{black}"
}

# Prints the current directory path (PWD) with the name of parent directories
# abbreviated. A tilde character (~) substitutes the ${HOME} directory.
function _outer_space::print_pwd_abbreviated {
  typeset -a pwd=("${(s./.)PWD/${HOME}/~}")
  [[ ${#pwd} > 1 ]] &&
  for splits_iterator in {1..$((${#pwd} - 1))}; do
    [[ "${pwd[splits_iterator]}" == .* ]] &&
    pwd[splits_iterator]="${pwd[splits_iterator][1,2]}" ||
    pwd[splits_iterator]="${pwd[splits_iterator][1]}"
  done
  echo "${(j./.)pwd}"
}

# If inside a Git repository, prints a decorator if there are changes to be
# commited.
function _outer_space::print_git_changes {
  [[ -n $(git status --porcelain 2>/dev/null) ]] &&
  echo " "
}

# If inside a Git repository, prints the name of the branch and if there are
# changes to be commited.
function _outer_space::print_git_info {
  typeset -r branch=$(git branch --show-current 2>/dev/null)
  [[ -n ${branch} ]] &&
  echo "%K{green}%F{red}%F{black} $(_outer_space::print_git_changes)󰈿 ${branch} %k%F{green}" ||
  echo "%k%F{red}"
}

# The "precmd" function is a ZSH builtin function that gets executed every time
# before the prompt gets printed.
#
# This setup is a work-around to make it print a new line after each command to
# make the theme be more comfortable to use.
function precmd {
  function precmd {
    echo
  }
}

PROMPT='%K{black} 󰢚 %n%F{red}@%f%m $(_outer_space::print_venv)  $(_outer_space::print_pwd_abbreviated) $(_outer_space::print_git_info)%f
%F{red}%f '
