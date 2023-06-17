setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT="1"

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
	echo "󱒄 "
}

function _outer_space::branch {
	typeset -r branch=$(git branch --show-current 2>/dev/null)
	[[ -n ${branch} ]] &&
	echo "%K{green}%F{red}%F{black} $(_outer_space::changes) %B${branch}%b %k%F{green}" ||
	echo "%k%F{red}"
}

PROMPT='%K{black}%F{white} 󰢚 %n%F{red}@%F{white}%m %K{red}%F{black}  %B$(_outer_space::pwd) %b$(_outer_space::branch)%f
 %F{white}%F{red}%f '
