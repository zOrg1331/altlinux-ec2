#!/bin/bash

set -x
set -e

xzcat /tmp/base.img | sudo dd of=/dev/xvdf bs=1M

sudo sync
sleep 3
