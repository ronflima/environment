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
# Installs software packages that I depend on. Do not run it alone.
#
# Author: <Ronaldo Faria Lima> ronaldo.faria.lima@gmail.com
#

if [ "$OSTYPE" == "linux-gnu" ]
then
    BASE_PACKAGES="software-properties-common zlibc libbz2-dev dbus-x11"
    PACKAGES="make gcc g++ git emacs emacs-common-non-dfsg gnupg2 curl wget postgresql openssl zip unzip bzip2 graphviz"
    sudo apt-get update
    sudo apt-get install -y $BASE_PACKAGES
    sudo apt-add-repository non-free
    sudo apt-get update
    sudo apt-get install -y $PACKAGES
fi
