#!/bin/bash

ROOT_DIR=$(dirname $(dirname $(realpath "$0")))

find ${ROOT_DIR} -type f -name Manifest -exec rm -fv "{}" \;
find ${ROOT_DIR} -type f -name '*.ebuild' | while read FILE; do
	(cd $(dirname ${FILE}); ebuild $(basename ${FILE}) digest)
done
