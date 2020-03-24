#!/bin/bash
# Does not need to be executed as root.

function update_openwrt_packages() {
    # Updates package lists
    sudo opkg update
    # Upgrades all installed packages
    sudo opkg list-upgradable | cut -f 1 -d ' ' | sudo xargs opkg upgrade
}

# Call functions
read -r -p "Do you want to upgrade all installed packages? [y/N] " response
if [[ "${response}" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    update_openwrt_packages
fi
