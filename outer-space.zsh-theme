setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

__Outer_Space()
{
	Get_Virtual_Environment()
	{
		[[ -n ${VIRTUAL_ENV} ]] && echo "%K{3}%F{0} 󱎃 ${VIRTUAL_ENV##*/}"\
		                                "%K{red}%F{yellow}%F{black}" ||
		                           echo "%K{red}%F{black}"
	}

	Get_Directory()
	{
		typeset -a d=("${(s./.)PWD/${HOME}/~}")
		[[ ${#d} > 1 ]] && for i in {1..$((${#d} - 1))}; do
			[[ "${d[i]}" == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
		done
		echo ${(j./.)d}
	}

	Get_Changes()
	{
		[[ -n $(git status --porcelain 2>/dev/null) ]] && echo " "
	}

	Get_Branch()
	{
		typeset -r b=$(git branch --show-current 2>/dev/null)
		[[ -n $b ]] && echo "%K{green}%F{red}%F{black} $(Get_Changes)󰈿 $b"\
		                    "%k%F{green}" ||
		               echo "%k%F{red}"
	}

	echo "%K{0}%F{7} 󰢚 %n%F{1}@%F{7}%m $(Get_Virtual_Environment)"\
	     " $(Get_Directory) $(Get_Branch)%f "
}

PROMPT='$(__Outer_Space)'

