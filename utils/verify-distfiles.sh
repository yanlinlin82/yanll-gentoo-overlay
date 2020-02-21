#!/bin/bash

ROOT_DIR=$(dirname $(dirname $(realpath "$0")))

find ${ROOT_DIR} -name Manifest -exec grep ^DIST "{}" \; \
	| awk '{print$7" *"$2}' \
	| (cd /usr/portage/distfiles/ && sha512sum -c)
