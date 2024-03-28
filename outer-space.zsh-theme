export VIRTUAL_ENV_DISABLE_PROMPT=1;

setopt promptsubst;

function _outerSpace_writeGitDirtyStatusModule
{
    [[ $(git status -s 2>/dev/null) ]] && echo " ";
}

function _outerSpace_writeGitModule
{
    branch=$(git branch --show-current 2>/dev/null);
    [[ ${branch} ]] &&
        echo "%F{black}%K{green}%F{red} %F{black}$(_outerSpace_writeGitDirtyStatusModule)󰈿${branch} %F{green}";
}

function _outerSpace_writePathModule
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

function _outerSpace_writeVirtualEnvModule
{
    [[ ${VIRTUAL_ENV} ]] && echo "%K{yellow} 󱎃 ${VIRTUAL_ENV##*/} %F{yellow}";
}

PROMPT='%K{black}%F{white} 󰢚 %n%F{red}@%F{white}%m %F{black}$(_outerSpace_writeVirtualEnvModule)%K{red} %F{black} \
$(_outerSpace_writePathModule) %F{red}$(_outerSpace_writeGitModule)%k%F{white}%f ';
