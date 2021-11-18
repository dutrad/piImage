DESCRIPTION = "Fetch and install Temp Monitor"
LICENSE = "CLOSED"

DEPENDS = "systemd"
RDEPENDS:${PN} += "python3 python3-pyserial"

S = "${WORKDIR}/git"
SRC_URI = "git://github.com/dutrad/TempMonitor.git;protocol=https"
SRC_URI[sha256sum] = "14a3973726c04a99e6aa48dd31c4a13d38e8975cfff8e85d3f5a1523fd9af768"
SRCREV = "master"

inherit systemd 
SYSTEMD_SERVICE_${PN} = "TempMonitor.service"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/TempMonitor.py ${D}${bindir}
    install -m 0755 ${S}/TestBoard.py ${D}${bindir}
    install -m 0755 ${S}/serialPort.py ${D}${bindir}

    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${S}/TempMonitor.service ${D}/${systemd_unitdir}/system
}

RPROVIDES:${PN} += "tempmonitor"