#/bin/bash
# Verifica se o lsb_release está instalado, se não, instala
if ! command -v lsb_release &> /dev/null; then
    echo "lsb_release não encontrado. Instalando..."
    # A instalação do lsb_release pode variar dependendo da sua distribuição Linux
    # Exemplo para Debian/Ubuntu:
    sudo apt-get update && sudo apt-get install -y lsb-release 
fi

# Exibe informações sobre a distribuição Linux
lsb_release -a



#################### K3S
# Verifica se o k3s já está instalado
if ! command -v k3s &> /dev/null; then
    echo "k3s não encontrado. Instalando..."
    wget -O - https://get.k3s.io | sh - 
else
    echo "k3s já está instalado."
fi

# Verifica o status do serviço k3s
# systemctl status k3s

# Cria o diretório .kube se ele não existir
mkdir -p $HOME/.kube

# Copia o arquivo de configuração do k3s para o diretório .kube
cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config

# Lista os nodes do cluster Kubernetes
kubectl get nodes


#################### KUBECTL
# Download the latest kubectl release with the command:
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Download the checksum file:
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

# Validate the kubectl binary against the checksum file:
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Install kubectl:
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Set the kubectl completion script source for your shell sessions: For all users on the system:
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null

# Set an alias for kubectl as k.
echo 'alias k=kubectl' >>~/.bashrc

# Enable the alias for auto-completion.
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc


#################### HELM
# Verifica se o Helm já está instalado
if ! command -v helm &> /dev/null; then
    echo "Helm não encontrado. Instalando..."
    # Download do instalador do Helm
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
    rm -f get_helm.sh
else
    echo "Helm já está instalado."
fi


#################### CERT-MANAGER
# Adiciona o repositório do cert-manager se ele ainda não existir
if ! helm repo list | grep -q jetstack; then
    helm repo add jetstack https://charts.jetstack.io
fi

# Atualiza os repositórios do Helm
helm repo update

# Verifica se o cert-manager já está instalado no namespace cert-manager
if ! helm list -n cert-manager | grep -q cert-manager; then
    # Instala o cert-manager 
    helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.12.0 --set installCRDs=true
else
    echo "cert-manager já está instalado."
fi


#################### INGRESS NGINX
# Adiciona o repositório do Ingress Nginx se ele ainda não existir
if ! helm repo list | grep -q ingress-nginx; then
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
fi

# Atualiza os repositórios do Helm
helm repo update

# Instala ou atualiza o Ingress Nginx
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --create-namespace --namespace ingress-nginx --set controller.service.type=NodePort


#################### KIND
# kind (verificar se já está instalado antes de baixar)
if ! command -v kind &> /dev/null; then
    echo "kind não encontrado. Instalando..."
    # Para AMD64 / x86_64
    [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64
    # Para ARM64
    [ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-arm64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
else
    echo "kind já está instalado."
fi


#################### YQ
# yq (verificar se já está instalado antes de baixar)

#VERSION=v4.2.0 
#BINARY=yq_linux_amd64
#wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY} -O /usr/bin/yq &&\
#chmod +x /usr/bin/yq

if ! command -v yq &> /dev/null; then
    echo "yq não encontrado. Instalando..."
    # last version
    wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
        chmod +x /usr/bin/yq
else
    echo "yq já está instalado."
fi