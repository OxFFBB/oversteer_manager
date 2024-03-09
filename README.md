# Oversteer Manager

This script automates the installation and management of the oversteer program, which SteamOS will notoriously break on system update.

### Usage

oversteer_manager.sh

usage:  [ -h ] [ -f ] [ -e ]
  options:
    -h     Help               Shows this help message
    -f     Fresh Install      Configures pacman and does a fresh build and install of oversteer
    -e     Existing Install   Re-installs required libaries to enable oversteer function after steamdeck update

## Credits for oversteer

  - [Oversteer](https://github.com/berarma/oversteer) - Used
    for the Code of Conduct
  - [Oversteer ported to Arch](https://aur.archlinux.org/packages/oversteer) - 

## License

This project is licensed under the [CC0 1.0 Universal](LICENSE.md)
Creative Commons License - see the [LICENSE.md](LICENSE.md) file for
details
