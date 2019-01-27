#!/bin/bash -e

SOURCE_DIR="${ROOTFS_DIR}/etc/apt/sources.list.d"

install -d ${SOURCE_DIR}
install -m 664 files/docker.list ${SOURCE_DIR}
install -m 664 files/kubernetes.list ${SOURCE_DIR}

on_chroot << EOF
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
curl -s https://download.docker.com/linux/raspbian/gpg | sudo apt-key add -
apt-get update
EOF