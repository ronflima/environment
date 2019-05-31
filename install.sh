# !/bin/bash
#
# MIT License
#
# Copyright (c) 2019 Ronaldo F. Lima
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# Installs all of my stuff, configuring the environment as needed
# Author: <Ronaldo Faria Lima> ronaldo.faria.lima@gmail.com
#

BASH_FILES="bashrc bash_profile bash_aliases bash_logout"
BASEDIR="$(cd "$(dirname "$0")"; pwd -P)"

function create_backup_dir {
    BACKUPDIR=$HOME/.environment_backup
    
    if [ ! -d $BACKUPDIR ]
    then
        mkdir $BACKUPDIR 
    fi
}

#
# Bash stuff
#
for bash_file in $BASH_FILES
do
    TARGET=$HOME/.$bash_file 
    if [[ -f $TARGET || -L $TARGET ]]
    then
        if [ -f $TARGET ]
        then
            echo "Backing up .$bash_file..."
            create_backup_dir
            mv $TARGET $BACKUPDIR
        else
            echo "Removing .$bash_file link..."
            \rm -f $TARGET
        fi
    fi
    echo "Installing new .$bash_file..."
    ln -s $BASEDIR/bash/$bash_file $TARGET 
done

#
# Emacs stuff
#
EMACS_HOME=$HOME/.emacs.d

echo "Installing emacs goodies..."
if [ -d $EMACS_HOME ]
then
    echo "Backing up emacs..."
    create_backup_dir
    mv $EMACS_HOME $BACKUPDIR
fi
ln -s $BASEDIR/emacs.d $EMACS_HOME 

#
# WSL Settings
#
if [ -f /etc/wsl.conf ]
then
    create_backup_dir
    sudo mv /etc/wsl.conf $BACKUPDIR
    sudo cp $BASEDIR/wsl.conf /etc/wsl.conf
fi
