# This software is a part of ISAR.
# Copyright (c) Siemens AG, 2019
#
# SPDX-License-Identifier: MIT

inherit dpkg

S = "${WORKDIR}/git"

GBP_DEPENDS ?= "git-buildpackage pristine-tar"
GBP_EXTRA_OPTIONS ?= "--git-pristine-tar"

do_install_builddeps_append() {
    dpkg_do_mounts
    E="${@ isar_export_proxies(d)}"
    sudo -E chroot ${BUILDCHROOT_DIR} \
        apt-get install -y -o Debug::pkgProblemResolver=yes \
                        --no-install-recommends ${GBP_DEPENDS}
    dpkg_undo_mounts
}

dpkg_runbuild_prepend() {
    export GBP_PREFIX="gbp buildpackage --git-ignore-new ${GBP_EXTRA_OPTIONS} --git-builder="
}
