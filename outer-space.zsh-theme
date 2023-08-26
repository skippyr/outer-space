export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

_outer_space_get_venv() {
  [[ ${VIRTUAL_ENV} ]] && echo "%K{3} 󱎃 ${VIRTUAL_ENV##*/} %F{3}"
}

_outer_space_get_abbr_dir() {
  d=("${(s./.)PWD/${HOME}/~}")
  [[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
    [[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
  done
  echo ${(j./.)d}
}

_outer_space_get_drt_changes() {
  [[ $(git status -s 2>/dev/null) ]] && echo " "
}

_outer_space_get_branch() {
  b=$(git branch --show-current 2>/dev/null)
  [[ ${b} ]] &&
  echo "%F{0}%K{2}%F{1}%F{0} $(_outer_space_get_drt_changes)󰈿${b} %F{2}"
}

PROMPT='%K{0} 󰢚 %n%F{1}@%f%m %F{0}$(_outer_space_get_venv)%K{1}%F{0} \
 $(_outer_space_get_abbr_dir) %F{1}$(_outer_space_get_branch)%k%f '
