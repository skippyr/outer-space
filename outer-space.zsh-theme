export VIRTUAL_ENV_DISABLE_PROMPT=1;

setopt promptsubst;

function _OuterSpace_WriteGitDirtyStatusModule
{
    [[ $(git status -s 2>/dev/null) ]] && echo " ";
}

function _OuterSpace_WriteGitModule
{
    branch=$(git branch --show-current 2>/dev/null);
    [[ ${branch} ]] &&
        echo "%F{black}%K{green}%F{red} %F{black}$(_OuterSpace_WriteGitDirtyStatusModule)󰈿${branch} %F{green}";
}

function _OuterSpace_WritePathModule
{
    pathSplits=("${(s./.)PWD/${HOME}/~}");
    [[ ${#pathSplits} -gt 1 ]] &&
        for index in {1..$((${#pathSplits} - 1))};
        do
            [[ ${pathSplits[index]} == .* ]] &&
                pathSplits[index]=${pathSplits[index][1,2]} ||
                pathSplits[index]=${pathSplits[index][1]};
        done
    echo ${(j./.)pathSplits};
}

function _OuterSpace_WriteVirtualEnvModule
{
    [[ ${VIRTUAL_ENV} ]] && echo "%K{yellow} 󱎃 ${VIRTUAL_ENV##*/} %F{yellow}";
}

PROMPT='%K{black}%F{white} 󰢚 %n%F{red}@%F{white}%m %F{black}$(_OuterSpace_WriteVirtualEnvModule)%K{red} %F{black} \
$(_OuterSpace_WritePathModule) %F{red}$(_OuterSpace_WriteGitModule)%k%F{white}%f ';
