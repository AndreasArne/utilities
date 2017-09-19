#!/bin/bash

# check ovpn status - if no access restart vpn
wget -q --spider https://www.ovpn.com/v1/api/client/ptr

if [ $? -ne 0 ]; then
    echo "Offline"
    sudo service openvpn restart
fi
