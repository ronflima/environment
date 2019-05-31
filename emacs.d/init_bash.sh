export STARTED_FROM_EMACS=TRUE

if [ -f $HOME/.bash_profile ]
then
    . $HOME/.bash_profile
fi
if [ -f $HOME/.bashrc ]
then
    . $HOME/.bashrc
fi
