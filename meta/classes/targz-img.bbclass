# This software is a part of ISAR.
# Copyright (c) Siemens AG, 2018
#
# SPDX-License-Identifier: MIT

TARGZ_IMAGE_FILE = "${DEPLOY_DIR_IMAGE}/${IMAGE_FULLNAME}.tar.gz"

do_targz_image() {
    rm -f ${TARGZ_IMAGE_FILE}
    sudo tar -cvzf ${TARGZ_IMAGE_FILE} --one-file-system -C ${IMAGE_ROOTFS} .
    sudo chown $(id -u):$(id -g) ${TARGZ_IMAGE_FILE}
}

addtask targz_image before do_image after do_image_tools
do_targz_image[dirs] = "${DEPLOY_DIR_IMAGE}"
