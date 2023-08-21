export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function __Outer_Space__Get_Virtual_Environment()
{
    [[ ${VIRTUAL_ENV} ]] && echo "%K{3} 󱎃 ${VIRTUAL_ENV##*/}"                 \
                                 "%K{1}%F{3}%F{0}" || echo "%K{1}"
}

function __Outer_Space__Get_Directory_Abbreviated()
{
    typeset -a directory_splits=("${(s./.)PWD/${HOME}/~}")
    [[ ${#directory_splits} -gt 1 ]] &&
        for directory_split_index in {1..$((${#directory_splits} - 1))}; do
            [[ "${directory_splits[directory_split_index]}" == .* ]] &&
                directory_splits[directory_split_index]=${directory_splits[directory_split_index][1,2]} ||
                directory_splits[directory_split_index]=${directory_splits[directory_split_index][1]}
        done
    echo ${(j./.)directory_splits}
}

function __Outer_Space__Check_For_Git_Changes()
{
    [[ $(git status --porcelain 2>/dev/null) ]] && echo " "
}

function __Outer_Space__Get_Git_Branch()
{
    typeset -r branch=$(git branch --show-current 2>/dev/null)
    [[ ${branch} ]] && echo "%K{2}%F{0}"                                     \
                            "$(__Outer_Space__Check_For_Git_Changes)󰈿"         \
                            "${branch} %k%F{2}" || echo "%k"
}

PROMPT='%K{0}%F{7} 󰢚 %n%F{1}@%F{7}%m %F{0}$(__Outer_Space__Get_Virtual_Environment)  $(__Outer_Space__Get_Directory_Abbreviated) %F{1}$(__Outer_Space__Get_Git_Branch)%f '
