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
INSTALLER_DIR="$BASEDIR/installer"
INSTALLERS="$(ls $INSTALLER_DIR/*.sh | sort)"

function create_backup_dir {
    BACKUPDIR=$HOME/.environment_backup
    
    if [ ! -d $BACKUPDIR ]
    then
        mkdir $BACKUPDIR 
    fi
}

function install_file() {
   if [ -f $1/$2 ]
    then
        create_backup_dir
        sudo mv $1/$2 $BACKUPDIR
    fi
    sudo cp $BASEDIR/$2 $1/$2
}


for installer in $INSTALLERS
do
    echo "Installing $(echo $installer | sed -E 's/[a-z./]+install_[0-9][0-9]_([a-z]+)\.sh/\1/g')..."
    source $installer
done

