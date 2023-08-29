export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function _outer_space {
  function get_venv {
    [[ ${VIRTUAL_ENV} ]] && echo "%K{3} 󱎃 ${VIRTUAL_ENV##*/} %F{3}"
  }

  function get_cwd {
    d=("${(s./.)PWD/${HOME}/~}")
    [[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
      [[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
    done
    echo ${(j./.)d}
  }

  function stat_dirty {
    [[ $(git status -s 2>/dev/null) ]] && echo " "
  }

  function get_branch {
    b=$(git branch --show-current 2>/dev/null)
    [[ ${b} ]] && echo "%F{0}%K{2}%F{1} %F{0}$(stat_dirty)󰈿${b} %F{2}"
  }

  echo "%K{0}%F{7} 󰢚 %n%F{1}@%F{7}%m %F{0}$(get_venv)%K{1} %F{0} $(get_cwd)"\
       "%F{1}$(get_branch)%k%F{7}%f "
}

PROMPT='$(_outer_space)'
