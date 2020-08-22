#!/bin/sh

# Copyright (c) 2018 Verb Networks Pty Ltd <contact [at] verbnetworks.com>
#  - All rights reserved.
#
# Apache License v2.0
#  - http://www.apache.org/licenses/LICENSE-2.0

# volume0 - if defined
if [ $(echo -n ${volume0_dev} | wc -c) -gt 8 ]; then
    while [ ! -b ${volume0_dev} ];
        do sleep 1;
    done;
    if [ $(cat /etc/fstab | grep "${volume0_mount}" | wc -l) -lt 1 ]; then
        echo $(lsblk --fs --output UUID --noheadings --pairs ${volume0_dev})' '${volume0_mount}' '${volume0_fstype}' defaults 0 2' >> /etc/fstab
    fi
    mount --all
fi;

# volume1 - if defined
if [ $(echo -n ${volume1_dev} | wc -c) -gt 8 ]; then
    while [ ! -b ${volume1_dev} ];
        do sleep 1;
    done;
    if [ $(cat /etc/fstab | grep "${volume1_mount}" | wc -l) -lt 1 ]; then
        echo $(lsblk --fs --output UUID --noheadings --pairs ${volume1_dev})' '${volume1_mount}' '${volume1_fstype}' defaults 0 2' >> /etc/fstab
    fi
    mount --all
fi;
