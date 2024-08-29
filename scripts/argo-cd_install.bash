#/bin/bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# via HELM
# helm repo add argo https://argoproj.argo-cd.github.io/argo-helm
# helm repo update
# helm install argocd argo/argo-cd -n argocd


# obter a senha inicial
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

r5Iw6aHNWOiShwG9


# Teste
kubectl get svc argocd-server -n argocd