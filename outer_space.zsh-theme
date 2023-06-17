setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT="1"

function _outer_space::venv {
	typeset -r venv=${VIRTUAL_ENV##*/}
	[[ -n ${venv} ]] &&
	echo "%K{yellow}%F{black} 󱎃 %B${venv}%b %K{red}%F{yellow}%F{black}" ||
	echo "%K{red}%F{black}"
}

function _outer_space::pwd {
	typeset pwd=("${(s./.)PWD/${HOME}/~}")
	[[ ${#pwd} > 1 ]] &&
	for splits_iterator in {1..$((${#pwd} - 1))}; do
		[[ "${pwd[splits_iterator]}" == .* ]] &&
		pwd[splits_iterator]=${pwd[splits_iterator][1,2]} ||
		pwd[splits_iterator]=${pwd[splits_iterator][1]}
	done
	echo ${(j./.)pwd}
}

function _outer_space::changes {
	[[ -n $(git status --porcelain 2>/dev/null) ]] &&
	echo " "
}

function _outer_space::branch {
	typeset -r branch=$(git branch --show-current 2>/dev/null)
	[[ -n ${branch} ]] &&
	echo "%K{green}%F{red}%F{black} $(_outer_space::changes)󰈿 %B${branch}%b %k%F{green}" ||
	echo "%k%F{red}"
}

function precmd {
	function precmd {
		echo
	}
}

PROMPT='%K{black} 󰢚 %n%F{red}@%f%m $(_outer_space::venv)  %B$(_outer_space::pwd)%b $(_outer_space::branch)%f
 %F{red}%f '
