# Base this image on core-image-base
inherit core-image

DISTRO = "piTempDistro"
IMAGE_INSTALL:append = " tempmonitor"
MACHINE = "raspberrypi3"