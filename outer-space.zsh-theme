setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

__Outer_Space() {
    Get_Virtual_Environment() {
        [[ ${VIRTUAL_ENV} ]] &&
            echo "%K{3} 󱎃 ${VIRTUAL_ENV##*/} %K{1}%F{3}%F{0}" ||
            echo "%K{1}"
    }

    Get_Directory() {
        typeset -a d=("${(s./.)PWD/${HOME}/~}")
        [[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
            [[ "${d[i]}" == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
        done
        echo ${(j./.)d}
    }

    Get_Changes() {
        [[ $(git status --porcelain 2>/dev/null) ]] && echo " "
    }

    Get_Branch() {
        typeset -r b=$(git branch --show-current 2>/dev/null)
        [[ ${b} ]] &&
            echo "%K{2}%F{0} $(Get_Changes)󰈿 ${b} %k%F{2}" ||
            echo "%k"
    }

    echo\
        "%K{0}%F{7} 󰢚 %n%F{1}@%F{7}%m %F{0}$(Get_Virtual_Environment)"\
        " $(Get_Directory) %F{1}$(Get_Branch)%f "
}

PROMPT='$(__Outer_Space)'
