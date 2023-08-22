export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function _outer_space_get_venv() {
  [[ ${VIRTUAL_ENV} ]] && echo "%K{3} 󱎃 ${VIRTUAL_ENV##*/}"                   \
                               "%K{1}%F{3}%F{0}" || echo "%K{1}"
}

function _outer_space_get_dir_abbr() {
  local d=("${(s./.)PWD/${HOME}/~}")
  [[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
    [[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
  done
  echo ${(j./.)d}
}

function _outer_space_get_dirty_changes() {
  [[ $(git status --porcelain 2>/dev/null) ]] && echo " "
}

function _outer_space_get_branch() {
  local b=$(git branch --show-current 2>/dev/null)
  [[ ${b} ]] && echo "%K{2}%F{0} $(_outer_space_get_dirty_changes)󰈿${b}"     \
                     "%k%F{2}" || echo "%k"
}

PROMPT='%K{0}%F{7} 󰢚 %n%F{1}@%F{7}%m %F{0}$(_outer_space_get_venv)  \
$(_outer_space_get_dir_abbr) %F{1}$(_outer_space_get_branch)%f '
