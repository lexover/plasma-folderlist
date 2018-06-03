# Plasma Systemd Control

This is a simple plasma applet for KDE Plasma 5 to control systemd services. It is not designed to be a complete user interface for systemd, but it provides an convenient way to start and stop selected services. 

### Supported Features
* start service (`sudo systemctl start SERVICE`)
* stop service (`sudo systemctl stop SERVICE`)
* updates automatically if status changed externally
* system units and user units (--user)

### Installation
1. mkdir biuld
2. cd build
3. cmake -DCMAKE_INSTALL_PREFIX=\`qtpaths --install-prefix\` -DCMAKE_BUILD_TYPE=Release -DLIB_INSTALL_DIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON ../
4. make
5. make install

For Arch Linux there is a package available via AUR: https://aur.archlinux.org/packages/plasma5-applets-systemd/

### Dependencies (Debian)

* cmake
* linux-libc-dev
* build-essential
* extra-cmake-modules
* libkf5config-dev
* libkf5plasma-dev
* qt5-default
* qtdeclarative5-dev

### Prerequisite

To work properly, you must be able to run `sudo systemctl` without password. Usually you can achieve this be editing `/etc/sudoers` with visudo. 

