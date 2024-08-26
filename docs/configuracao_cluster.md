# Configuração do Cluster e Exposição na Rede

Este documento descreve como configurar o cluster Kubernetes (k3s) e expor o Ingress para acesso externo.

## Instalação do k3s

1. Execute o script `scripts/k3s-install.bash`.
2. Verifique o status do k3s com `sudo systemctl status k3s`.
3. Verifique os nós do cluster com `kubectl get nodes`.

## Configuração do Ingress

1. Adicione o repositório do Ingress NGINX: `helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx`
2. Atualize os repositórios: `helm repo update`
3. Instale o Ingress NGINX: `helm install ingress-nginx ingress-nginx/ingress-nginx --create-namespace --namespace ingress-nginx`

## Exposição do Ingress

* **Dependendo do seu ambiente, você pode precisar configurar o redirecionamento de portas ou usar um serviço de Load Balancer para expor o Ingress na rede. Consulte a documentação do seu provedor de nuvem ou plataforma para obter instruções específicas.**