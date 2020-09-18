#!/bin/bash

PACKAGE=www-apps/hugo
APP_VER=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep tag_name | cut -d: -f2 | cut -d\" -f2 | cut -c2-)
if [ "$(ls ${PACKAGE}/ | grep ebuild | cut -d- -f2 | sed 's/\.ebuild$//')" != "${APP_VER}" ]; then
	echo "Upgrade '${PACKAGE}'"
	mv -v ${PACKAGE}/hugo-*.ebuild ${PACKAGE}/hugo-${APP_VER}.ebuild
	(cd ${PACKAGE} && ebuild *.ebuild digest)
fi

PACKAGE=sci-biology/picard
APP_VER=$(curl -s https://api.github.com/repos/broadinstitute/picard/releases/latest | grep tag_name | cut -d: -f2 | cut -d\" -f2)
if [ "$(ls ${PACKAGE}/ | grep ebuild | cut -d- -f2 | sed 's/\.ebuild$//')" != "${APP_VER}" ]; then
	echo "Upgrade '${PACKAGE}'"
	mv -v ${PACKAGE}/picard-*.ebuild ${PACKAGE}/picard-${APP_VER}.ebuild
	(cd ${PACKAGE} && ebuild *.ebuild digest)
fi
