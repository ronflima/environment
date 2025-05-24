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
# Installer for my bash files. You should never run it alone. It depends on the
# Install script
#
# Author: <Ronaldo Faria Lima> ronaldo.faria.lima@gmail.com
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
