#/bin/bash
wget -O - https://get.k3s.io | sh -
sudo systemctl status k3s
kubectl get nodes
cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config 
kubectl get nodes
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx --create-namespace --namespace ingress-nginx
