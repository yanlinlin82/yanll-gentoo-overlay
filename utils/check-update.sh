#!/bin/bash

HUGO_VER=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep tag_name | cut -d: -f2 | cut -d\" -f2 | cut -c2-)

if [ "$(ls www-apps/hugo/ | grep ebuild | cut -d- -f2 | sed 's/\.ebuild$//')" != "${HUGO_VER}" ]; then
	echo "Upgrade 'www-apps/hugo'"
	mv -v www-apps/hugo/hugo-*.ebuild www-apps/hugo/hugo-${HUGO_VER}.ebuild
	cd www-apps/hugo && ebuild *.ebuild digest
fi
