if [ -r ${HOME}/.zsh/.exports ]; then
  source ${HOME}/.zsh/.exports;
fi

if [ -r ${HOME}/.zsh/.aliases ]; then
  source ${HOME}/.zsh/.aliases;
fi

if [ -r ${HOME}/.zsh/.options ]; then
  source ${HOME}/.zsh/.options;
fi

if [ -r ${HOME}/.zsh/.functions ]; then
  source ${HOME}/.zsh/.functions;
fi

if [ -r ${HOME}/.zsh/.sources ]; then
  source ${HOME}/.zsh/.sources;
fi

mkdir -p -m 711 /tmp/${USER}

TMUX=$(which tmux)
if [ -x ${TMUX} ]; then
  if [ $(tmux has-session) ]; then
    TMUX_ARGS="attach"
  fi
    exec tmux ${TMUX_ARGS:-new-session}
fi
