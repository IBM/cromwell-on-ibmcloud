#!/bin/bash
sudo gpasswd -a lsfadmin docker
sudo systemctl enable docker
sudo systemctl start docker
sudo sh -c 'echo "gpasswd -a lsfadmin docker; systemctl enable docker; systemctl start docker" >> /opt/ibm/lsf/conf/resource_connector/ibmcloudgen2/user_data.sh'

echo "gpasswd -a lsfadmin docker; systemctl enable docker; systemctl start docker" > ~/shared/setup.sh

for worker in `lshosts -aw | tail -n +2 | grep Dyn | sed -e 's/^\([^ ]*\) *.*/\1/g'`; do
    ssh -t $worker sudo sh ~/shared/setup.sh
done
