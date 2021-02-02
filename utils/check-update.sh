#!/bin/bash

PACKAGE=www-apps/hugo
APP_VER=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep tag_name | cut -d: -f2 | cut -d\" -f2 | cut -c2-)
if [ -n "${APP_VER}" -a "$(ls ${PACKAGE}/ | grep ebuild | cut -d- -f2 | sed 's/\.ebuild$//')" != "${APP_VER}" ]; then
	echo "Upgrade '${PACKAGE}'"
	mv -v ${PACKAGE}/hugo-*.ebuild ${PACKAGE}/hugo-${APP_VER}.ebuild
	(cd ${PACKAGE} && ebuild *.ebuild digest)
fi

PACKAGE=sci-libs/htslib
APP_VER=$(curl -s https://api.github.com/repos/samtools/htslib/releases/latest | grep tag_name | cut -d: -f2 | cut -d\" -f2)
if [ -n "${APP_VER}" -a "$(ls ${PACKAGE}/ | grep ebuild | cut -d- -f2 | sed 's/\.ebuild$//')" != "${APP_VER}" ]; then
	echo "Upgrade '${PACKAGE}'"
	mv -v ${PACKAGE}/htslib-*.ebuild ${PACKAGE}/htslib-${APP_VER}.ebuild
	(cd ${PACKAGE} && ebuild *.ebuild digest)
fi

PACKAGE=sci-biology/samtools
APP_VER=$(curl -s https://api.github.com/repos/samtools/samtools/releases/latest | grep tag_name | cut -d: -f2 | cut -d\" -f2)
if [ -n "${APP_VER}" -a "$(ls ${PACKAGE}/ | grep ebuild | cut -d- -f2 | sed 's/\.ebuild$//')" != "${APP_VER}" ]; then
	echo "Upgrade '${PACKAGE}'"
	mv -v ${PACKAGE}/samtools-*.ebuild ${PACKAGE}/samtools-${APP_VER}.ebuild
	(cd ${PACKAGE} && ebuild *.ebuild digest)
fi

PACKAGE=sci-biology/picard
APP_VER=$(curl -s https://api.github.com/repos/broadinstitute/picard/releases/latest | grep tag_name | cut -d: -f2 | cut -d\" -f2)
if [ -n "${APP_VER}" -a "$(ls ${PACKAGE}/ | grep ebuild | cut -d- -f2 | sed 's/\.ebuild$//')" != "${APP_VER}" ]; then
	echo "Upgrade '${PACKAGE}'"
	mv -v ${PACKAGE}/picard-*.ebuild ${PACKAGE}/picard-${APP_VER}.ebuild
	(cd ${PACKAGE} && ebuild *.ebuild digest)
fi

PACKAGE=sci-biology/bowtie
APP_VER=$(curl -s https://api.github.com/repos/BenLangmead/bowtie2/releases/latest | grep tag_name | cut -d: -f2 | cut -d\" -f2 | cut -c2-)
if [ -n "${APP_VER}" -a "$(ls ${PACKAGE}/ | grep ebuild | cut -d- -f2 | sed 's/\.ebuild$//')" != "${APP_VER}" ]; then
	echo "Upgrade '${PACKAGE}'"
	mv -v ${PACKAGE}/bowtie-*.ebuild ${PACKAGE}/bowtie-${APP_VER}.ebuild
	(cd ${PACKAGE} && ebuild *.ebuild digest)
fi
