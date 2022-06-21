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
BASE_PACKAGES="software-properties-common zlibc libbz2-dev dbus-x11 tk-dev x11-xkb-utils"
read -r -d '' PACKAGES<<PKG
make gcc g++ git emacs   
gnupg2 curl wget postgresql openssl zip unzip bzip2 graphviz
openssl libffi-dev libssl-dev libreadline-dev libsqlite3-dev sqlite3
libcairo2-dev ffmpeg libbluetooth-dev tk-dev uuid-dev
PKG

if [ "$OSTYPE" == "linux-gnu" ]
then
    sudo apt-get update
    sudo apt-get install -y $BASE_PACKAGES
    sudo apt-add-repository non-free
    sudo apt-get update
    sudo apt-get install -y $PACKAGES
fi
