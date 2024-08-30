#!/bin/bash
systemctl stop k3s
/usr/local/bin/k3s-uninstall.sh
/usr/local/bin/k3s-agent-uninstall.sh
systemctl status k3s
ps aux | grep k3s
which k3s kubectl crictl ctr
ls -la /etc/rancher/k3s /var/lib/rancher/k3s
rm -rf /usr/local/bin/k3s /usr/local/bin/kubectl /usr/local/bin/crictl /usr/local/bin/ctr
rm -rf /etc/rancher/k3s /var/lib/rancher/k3s

docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -aq)
crictl rm -f $(crictl ps -aq)
crictl rmi -f $(crictl images -aq)