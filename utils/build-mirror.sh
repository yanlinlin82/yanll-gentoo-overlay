#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <output-dir>"
	exit 1
fi
ROOT_DIR=$(dirname $(dirname $(realpath "$0")))
OUTPUT_DIR="$1"

mkdir -pv "${OUTPUT_DIR}" || exit $?

find ${ROOT_DIR} -name Manifest -exec grep ^DIST "{}" \; \
	| awk '{print$2}' \
	| while read FILE; do
		cp -lv /usr/portage/distfiles/${FILE} ${OUTPUT_DIR}
	done
