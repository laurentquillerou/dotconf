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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/laurent/work/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/laurent/work/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/laurent/work/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/laurent/work/google-cloud-sdk/completion.zsh.inc'; fi
