# Linlin Yan's Gentoo Overlay

## Motivation

Gentoo ebuild provides an efficient and powerful way to manage software packages. Official portage tree could not include all software, especially in specific domains. Therefore, it is a good choice to build my own portage overlay, to incorporate software (bioinformatics, development, etc.) I am using, and also keep them update to the latest versions, as well as simple as possible.

## How to use

1. Add repository definition:

    ```sh
    sudo vi /etc/portage/repos.conf/yanll.conf
    ```

    with following content:

    ```
    [yanll]
    priority = 100
    location = /var/lib/yanll-gentoo-overlay/
    sync-type = git
    sync-uri = https://github.com/yanlinlin82/yanll-gentoo-overlay
    auto-sync = yes
    ```

2. Update portage:

    ```sh
    emerge --sync
    ```

3. Install package, for example:

    ```sh
    emerge -av cctools::yanll
    ```

## Useful commands

* Update all Manifest files:

    ```sh
    rm -fv */*/Manifest
    for f in */*/*.ebuild; do (cd $(dirname $f); ebuild $(basename $f) manifest); done
    ```
