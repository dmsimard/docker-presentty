#!/bin/bash
apt-get update
apt-get -y upgrade
apt-get -y install python-pip \
  python-virtualenv \
  git \
  cowsay \
  figlet \
  jp2a \
  libjpeg-dev \
  python-dev \
  zlib1g-dev

virtualenv $ROOT_DIR
pushd $ROOT_DIR
    source bin/activate
    git clone http://git.inaugust.com/cgit/presentty
    cd presentty
    # How deep does the rabbit hole go ?
    patch -p1 < /tmp/0001-Stop-handling-mouse-movements.patch
    rm /tmp/0001-Stop-handling-mouse-movements.patch
    pip install .
    deactivate
popd

ln -s $ROOT_DIR/bin/presentty /usr/local/bin/
ln -s /usr/games/cowsay /usr/local/bin/

# Cleanup
apt-get -y remove git
apt-get -y autoremove
apt-get clean
