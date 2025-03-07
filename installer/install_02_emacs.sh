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

EMACS_HOME=$HOME/.emacs.d

echo "Installing emacs..."
is_debian 
if [ $? -eq 1 ]
then 
    echo "deb http://http.us.debian.org/debian stable main non-free" | sudo tee -a /etc/apt/sources.list.d/emacs.sources  > /dev/null
fi
sudo apt-get install -y emacs emacs-common-non-dfsg

echo "Installing emacs goodies..."
if [ -d $EMACS_HOME ]
then
    echo "Backing up emacs..."
    create_backup_dir
    mv $EMACS_HOME $BACKUPDIR
fi
ln -s $BASEDIR/emacs.d $EMACS_HOME

# Try to install emacs packages
echo "Will call emacs to automatically install stuff..."
emacs -nw --load $INSTALLER_DIR/packages.lisp
