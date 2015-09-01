#!/bin/sh -e
# (c) 2015 Taeyeon Mori
# Set up shared mount
# Add to hook.mount

SHARED=/run/lxc/shared
MOUNTPOINT=/shared

# Check if we need to set up the shared directory
if ! cat /proc/mounts | cut -d" " -f2 | grep -q "$SHARED"; then
    [ -d "$SHARED" ] || mkdir -p "$SHARED"
    mount -t tmpfs shared "$SHARED"
    mount --make-unbindable "$SHARED"
    mount --make-shared "$SHARED"
fi

# Mount the shared dir
[ -d "$SHARED/$LXC_NAME" ] || mkdir "$SHARED/$LXC_NAME"
[ -d "$LXC_ROOTFS_MOUNT$MOUNTPOINT" ] || mkdir "$LXC_ROOTFS_MOUNT$MOUNTPOINT"
mount --bind "$SHARED/$LXC_NAME" "$LXC_ROOTFS_MOUNT$MOUNTPOINT"

