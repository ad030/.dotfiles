# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi

    SSH_ENV="$HOME/.ssh/env"

    # auto start ssh-agent
    function start_agent {
	echo "Initialising new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' >"$SSH_ENV"
	echo succeeded
	chmod 600 "$SSH_ENV"
	. "$SSH_ENV" >/dev/null
	/usr/bin/ssh-add; 
    }

    # Source SSH settings, if applicable

    if [ -f "$SSH_ENV" ]; then
	. "$SSH_ENV" >/dev/null
	#ps $SSH_AGENT_PID doesn't work under Cygwin
	ps -ef | grep $SSH_AGENT_PID | grep ssh-agent$ >/dev/null || {
	    start_agent
	} 
    else
	start_agent 
    fi 


fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# Added by Toolbox App
export PATH="$PATH:/home/ad030/.local/share/JetBrains/Toolbox/scripts"

