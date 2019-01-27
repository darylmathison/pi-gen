#!/bin/bash -e

# This installs the base instructions up to the point of joining / creating a cluster


dphys-swapfile swapoff
dphys-swapfile uninstall
update-rc.d dphys-swapfile remove


cp /boot/cmdline.txt /boot/cmdline_backup.txt
orig="$(head -n1 /boot/cmdline.txt) cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory"
echo $orig | tee /boot/cmdline.txt
