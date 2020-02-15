# Linlin Yan's Gentoo Overlay

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
