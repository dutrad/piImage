# Base this image on core-image-base
include recipes-core/images/core-image-base.bb

DISTRO_FEATURES:append = " wifi"

DISTRO_FEATURES:append = " systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
VIRTUAL-RUNTIME_init_manager = "systemd"
VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"

IMAGE_INSTALL:append = " tempmonitor"
IMAGE_INSTALL:append = " python3"