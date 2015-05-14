#!/bin/sh
# (c) 2015 Taeyeon Mori
# Set up shared mount
# Add to pre-start

SHARED=/run/lxc/shared
test -e $SHARED || lxc-shared-init
test -e $SHARED/$LXC_NAME || mkdir $SHARED/$LXC_NAME

