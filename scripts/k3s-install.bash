#/bin/bash
wget -O - https://get.k3s.io | sh -
sudo systemctl status k3s
kubectl get nodes
cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config 
kubectl get nodes
# Download do instalador do Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
#helm install ingress-nginx ingress-nginx/ingress-nginx --create-namespace --namespace ingress-nginx
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --set controller.service.type=NodePort
