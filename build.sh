#!/bin/bash
git submodule update --init --recursive

source poky/oe-init-build-env

bitbake-layers add-layer ../meta-openembedded/meta-oe/
bitbake-layers add-layer ../meta-openembedded/meta-python/
bitbake-layers add-layer ../meta-openembedded/meta-networking/
bitbake-layers add-layer ../meta-openembedded/meta-multimedia/
bitbake-layers add-layer ../meta-raspberrypi/ 
bitbake-layers add-layer ../meta-tempmonitor/

 echo "MACHINE=\"raspberrypi3\"">> conf/local.conf

 bitbake pi-temp