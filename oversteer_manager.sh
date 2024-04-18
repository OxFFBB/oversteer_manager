#! /bin/bash

GITHUB_REPO="https://aur.archlinux.org/oversteer.git"

function usage()
{
    cat << EOF

oversteer_manager.sh

usage:  [ -h ] [ -f ] [ -e ]
  options:
    -h     Help               Shows this help message
    -f     Fresh Install      Configures pacman and does a fresh build and install of oversteer
    -e     Existing Install   Re-installs required libaries to enable oversteer function after steamdeck update

EOF
}

function disable_readonly()
{
    sudo steamos-readonly disable
}

function pacman_keys()
{
    sudo pacman-key --init 
    sudo pacman-key --populate 
}

function pacman_init()
{
    pacman_keys
    sudo pacman -S --noconfirm fakeroot 
}

function update_clean()
{
    sudo rm -rf /etc/usb_modeswitch.setup
}

function build_oversteer_pkg()
{
    sudo pacman -S --noconfirm base-devel 
    git clone $GITHUB_REPO 
    cd oversteer 
    makepkg -s PKGBUILD 
}

function install_usb_modeswitch()
{
    sudo pacman -S --noconfirm usb_modeswitch 
}

function fresh_install()
{
    disable_readonly
    pacman_init
    build_oversteer_pkg
    sudo pacman -U --noconfirm oversteer-*.zst 
    cd ..
    rm -rf oversteer
    install_usb_modeswitch
    echo "Install Complete."
}

function existing_install()
{
    update_clean
    install_usb_modeswitch
}

while getopts ":hfe" option; do
    case $option in
        f)
            fresh_install
            ;;
        e)
            existing_install
            ;;
        h)
            usage
            exit;;
        \?)
            echo ""
            echo "!!!! Invalid option provided, refer to the usage guide. !!!!"
            usage
            exit;;
    esac
done

if [ $# -eq 0 ]; then
    usage
    exit 1
fi
