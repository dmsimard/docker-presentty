#!/bin/bash
dnf upgrade --refresh
dnf install -y python2-pip \
    python2-virtualenv \
    gcc \
    git \
    libjpeg-turbo-devel \
    figlet \
    cowsay \
    jp2a

virtualenv $ROOT_DIR
pushd $ROOT_DIR
    source bin/activate
    git clone http://git.inaugust.com/cgit/presentty
    cd presentty
    pip install .
    ln -s $ROOT_DIR/bin/presentty /usr/local/bin/
    deactivate
popd

# Cleanup
dnf remove -y gcc git
dnf clean all

