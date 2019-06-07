#!/bin/sh
# NOTE this files needs the executable bit set
# toc.txt expects a binary for "run" argument, "run=sh run.sh" does NOT work

# Simple mount/unmount toggle script
# Simplistic, only mounts first partition, not like https://github.com/ValveSoftware/steamlink-sdk/blob/master/rootfs/etc/init.d/startup/S01config

MOUNT_DISK=/mnt/disk
device=/dev/block/sda1

do_mount()
{
	mount ${device} ${MOUNT_DISK}
}

do_umount()
{
	umount ${MOUNT_DISK}
}

if [ ! -d ${MOUNT_DISK} ]
then
	mkdir -p ${MOUNT_DISK}
fi

#df ${MOUNT_DISK} | grep ${MOUNT_DISK}\$ && do_umount

# output never seen on Steam Link, so no need to 2>/dev/null
df ${MOUNT_DISK} | grep ${MOUNT_DISK}\$
status=$?
if [ $status -eq 0 ]
then
	do_umount
else
	do_mount
fi
# TODO look at switching icons/toc.txt around to display a different icon so mount status can be seen easily
