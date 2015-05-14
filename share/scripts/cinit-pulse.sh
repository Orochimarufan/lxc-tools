#!/bin/sh -x
# (c) 2015 Taeyeon Mori
# Mount /run/pulse
# Add to lxc.hook.mount
# /run must be mounted in fstab, not by guest OS!

RUNPULSE=/run/pulse

test -e "$RUNPULSE" || mkdir -p "$RUNPULSE"
test -e "$LXC_ROOTFS_MOUNT$RUNPULSE" || mkdir -p "$LXC_ROOTFS_MOUNT$RUNPULSE"
mount --bind "$RUNPULSE" "$LXC_ROOTFS_MOUNT$RUNPULSE"

