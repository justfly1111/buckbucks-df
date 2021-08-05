####MY BASH RC
source ~/.envvar

# Enable Bash completion.
if [[ -f /usr/local/share/bash-completion/bash_completion.sh ]]; then
    source /usr/local/share/bash-completion/bash_completion.sh
fi
#--------------------#
# Plugins
#--------------------#

# fzf
if [[ -d '/usr/local/share/examples/fzf/' ]]; then
    source /usr/local/share/examples/fzf/shell/completion.bash
    source /usr/local/share/examples/fzf/shell/key-bindings.bash
fi

#--------------------#
# Aliases
#--------------------#

source ~/.aliases
source ~/.envvar

# Let sh(1) know it's at home, despite /home being a symlink.
if [ "$PWD" != "$HOME" ] && [ "$PWD" -ef "$HOME" ] ; then cd ; fi

# Query terminal size; useful for serial lines.
if [ -x /usr/bin/resizewin ] ; then /usr/bin/resizewin -z ; fi

# Display a random cookie on each login.
if [ -x /usr/bin/fortune ] ; then /usr/bin/fortune freebsd-tips ; fi

source ~/.bash_completion/alacritty
. "$HOME/.cargo/env"
