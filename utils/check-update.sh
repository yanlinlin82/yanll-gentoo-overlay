#!/bin/bash

HUGO_VER=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep tag_name | cut -d: -f2 | cut -d\" -f2 | cut -c2-)
if [ "$(ls www-apps/hugo/ | grep ebuild | cut -d- -f2 | sed 's/\.ebuild$//')" != "${HUGO_VER}" ]; then
	echo "Upgrade 'www-apps/hugo'"
	mv -v www-apps/hugo/hugo-*.ebuild www-apps/hugo/hugo-${HUGO_VER}.ebuild
	cd www-apps/hugo && ebuild *.ebuild digest
fi

PICARD_VER=$(curl -s https://api.github.com/repos/broadinstitute/picard/releases/latest | grep tag_name | cut -d: -f2 | cut -d\" -f2)
if [ "$(ls sci-biology/picard/ | grep ebuild | cut -d- -f2 | sed 's/\.ebuild$//')" != "${PICARD_VER}" ]; then
	echo "Upgrade 'sci-biology/picard'"
	mv -v sci-biology/picard/picard-*.ebuild sci-biology/picard/picard-${PICARD_VER}.ebuild
	cd sci-biology/picard && ebuild *.ebuild digest
fi

CLI_VER=$(curl -s https://api.github.com/repos/cli/cli/releases/latest | grep tag_name | cut -d: -f2 | cut -d\" -f2 | cut -c2-)
if [ "$(ls dev-util/github-cli/ | grep ebuild | cut -d- -f2 | sed 's/\.ebuild$//')" != "${CLI_VER}" ]; then
	echo "Upgrade 'dev-util/github-cli'"
	mv -v dev-util/github-cli/github-cli-*.ebuild dev-util/github-cli/github-cli-${CLI_VER}.ebuild
	cd dev-util/github-cli && ebuild *.ebuild digest
fi
