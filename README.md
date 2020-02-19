# Linlin Yan's Gentoo Overlay

## Motivation

Gentoo ebuild provides an efficient and powerful way to manage software packages. Official portage tree could not include all software, especially in specific domains. Therefore, it is a good choice to build my own portage overlay, to incorporate software (bioinformatics, development, etc.) I am using, and also keep them update to the latest versions, as well as simple as possible.

## How to use

1. Download the repo via git:

    ```sh
    git clone https://github.com/yanlinlin82/yanll-gentoo-overlay
    ```

2. Add repo definition:

    ```sh
    sudo vi /etc/portage/repos.conf/yanll.conf
    ```

    with following content:

    ```
    [yanll]
    priority = 100
    location = /path/to/the/downloaded/repo
    auto-sync = yes
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
