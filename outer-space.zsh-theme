setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

_outer_space() {
  get_virtual_environment() {
    [[ ${VIRTUAL_ENV} ]] &&
      echo "%K{3} 󱎃 ${VIRTUAL_ENV##*/} %K{1}%F{3}%F{0}" || echo "%K{1}"
  }

  get_directory() {
    typeset -a directory_splits=("${(s./.)PWD/${HOME}/~}")
    [[ ${#directory_splits} -gt 1 ]] &&
      for directory_split_index in {1..$((${#directory_splits} - 1))}; do
        [[ "${directory_splits[directory_split_index]}" == .* ]] &&
          directory_splits[directory_split_index]=${directory_splits[directory_split_index][1,2]} ||
          directory_splits[directory_split_index]=${directory_splits[directory_split_index][1]}
      done
    echo ${(j./.)directory_splits}
  }

  get_changes() {
    [[ $(git status --porcelain 2>/dev/null) ]] && echo " "
  }

  get_branch() {
    typeset -r branch=$(git branch --show-current 2>/dev/null)
    [[ ${branch} ]] &&
      echo "%K{2}%F{0} $(get_changes)󰈿 ${branch} %k%F{2}" || echo "%k"
  }

  echo\
    "%K{0}%F{7} 󰢚 %n%F{1}@%F{7}%m %F{0}$(get_virtual_environment)"\
    " $(get_directory) %F{1}$(get_branch)%f "
}

PROMPT='$(_outer_space)'
