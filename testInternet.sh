#!/bin/bash

# check ovpn status - if no access restart vpn
# wget -q --spider https://www.ovpn.com/v2/api/client/ptr
#docker exec vpn_client /bin/bash -c "wget -q --spider https://www.ovpn.com/v2/api/client/ptr"

#if [ $? -ne 0 ]; then
#    echo "Offline"
    # sudo service openvpn restart
 cd ~/git/docker && docker-compose up -d vpn_client deluge jackett sonarr
#fi
