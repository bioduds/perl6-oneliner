#!/bin/bash
# Simple Perl6 Installation Automated
# Eduardo Capanema - bioduds@gmail.com
# August, 2016

# THIS INSTALL SCRIPT IS MADE FOR LINUX AND MAC ONLY
# Open terminal and type:
# curl https://install.perl6.org/ | sh;. ~/rakudo/setpath.sh

# MINIMAL REQUIREMENTS FOR INSTALLATION
# 2GB RAM or 1GB RAM + 1024MB swap

# ATTENTION
# 1. You need gcc compiler installed in order to proceed
# In Ubuntu, for instance, run:
# sudo apt-get install build-essential
# before installation
# 2. Perl6 needs a Perl5 version 5.10.1 or above to be already installed
# on your system

run_install () {
#echo "$SHELL"
# test if make and perl are runnable
command -v perl >/dev/null 2>&1 || { echo >&2 "perl is required to install Perl6 (Min. version 5.10.1). Please install it and try again."; exit 1; }
command -v make >/dev/null 2>&1 || { echo >&2 "make command is required to install Perl6. Please install it and try again."; exit 1; }
test -e ~/rakudo && { echo >&2 "There is already a rakudo directory in your home directory. Please move out of the way and try again."; exit 1; }
mkdir ~/rakudo && cd ~/rakudo
curl -O http://rakudo.org/downloads/star/rakudo-star-2016.07.tar.gz
tar -xzf rakudo-star-2016.07.tar.gz
cd rakudo-star-2016.07/
perl Configure.pl --backend=moar --gen-moar
make
# Running the tests is optional, but advised:
#make rakudo-test
#make rakudo-spectest
make install
echo "export PATH=$HOME/rakudo/rakudo-star-2016.07/install/bin:$HOME/rakudo/rakudo-star-2016.07/install/share/perl6/site/bin:$PATH" >> ~/rakudo/setpath.sh
echo "export PATH=$HOME/rakudo/rakudo-star-2016.07/install/bin:$HOME/rakudo/rakudo-star-2016.07/install/share/perl6/site/bin:$PATH" >> ~/.bashrc
}
run_install
