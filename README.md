# Plasma Folderlist

This is a simple plasma applet for KDE Plasma 5 to display a list of folders for quick navigation. There is no other functionality than open a directory. The official folder view is more complex and provides more features, but the ui is too cluttered if you just want to display directory names.

### Installation
1. mkdir biuld
2. cd build
3. cmake -DCMAKE_INSTALL_PREFIX=\`qtpaths --install-prefix\` -DCMAKE_BUILD_TYPE=Release -DLIB_INSTALL_DIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON ../
4. make
5. make install

For Arch Linux there is a package available via AUR: https://aur.archlinux.org/packages/plasma5-applets-folderlist/
