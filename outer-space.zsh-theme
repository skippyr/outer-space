setopt promptsubst;

export VIRTUAL_ENV_DISABLE_PROMPT=1;

_outer_space_write_git_dirty_status_module() {
  [[ $(git status -s 2>/dev/null) ]] && echo " ";
}

_outer_space_write_git_module() {
  branch=$(git branch --show-current 2>/dev/null);
  [[ ${branch} ]] &&
      echo "%F{black}%K{green}%F{red} %F{black}$(_outer_space_write_git_dirty_status_module)󰈿${branch} %F{green}";
}

_outer_space_write_path_module() {
  path_splits=("${(s./.)PWD/${HOME}/~}");
  [[ ${#path_splits} -gt 1 ]] &&
      for index in {1..$((${#path_splits} - 1))};
      do
        [[ ${path_splits[index]} == .* ]] &&
            path_splits[index]=${path_splits[index][1,2]} ||
            path_splits[index]=${path_splits[index][1]};
      done
  echo ${(j./.)path_splits};
}

_outer_space_write_virtual_env_module() {
  [[ ${VIRTUAL_ENV} ]] && echo "%K{yellow} 󱎃 ${VIRTUAL_ENV##*/} %F{yellow}";
}

PROMPT='%K{black}%F{white} 󰢚 %n%F{red}@%F{white}%m %F{black}\
$(_outer_space_write_virtual_env_module)%K{red} %F{black} \
$(_outer_space_write_path_module) %F{red}$(_outer_space_write_git_module)%k\
%F{white}%f ';
