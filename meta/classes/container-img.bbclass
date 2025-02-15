# This software is a part of ISAR.
# Copyright (C) Siemens AG, 2021
#
# SPDX-License-Identifier: MIT
#
# This class provides the task 'container_image'
# to create container images containing the target rootfs.

do_container_image[dirs] = "${DEPLOY_DIR_IMAGE}"
do_container_image[stamp-extra-info] = "${DISTRO}-${MACHINE}"
do_container_image[vardeps] += "CONTAINER_IMAGE_FORMATS"
do_container_image(){
    bbdebug 1 "Generate container image in these formats: ${CONTAINER_IMAGE_FORMATS}"
    containerize_rootfs "${IMAGE_ROOTFS}" "${CONTAINER_IMAGE_FORMATS}"
}

addtask container_image before do_image after do_image_tools
