#/bin/bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


kubectl apply -f argocd/argocd-application.yaml
kubectl apply -f argocd/argocd-ingress.yaml

# via HELM
# helm repo add argo https://argoproj.argo-cd.github.io/argo-helm
# helm repo update
# helm install argocd argo/argo-cd -n argocd


# obter a senha inicial
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

r5Iw6aHNWOiShwG9





echo "192.168.1.4 argocd.desafio" >> /etc/hosts

kubectl edit svc argocd-server -n argocd
mudar o type em ports de ClusterIP para NodePort

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort", "ports": [{"port": 80, "targetPort": 8080, "nodePort": 30080}, {"port": 443, "targetPort": 8080, "nodePort": 30443}]}}'



# Teste
kubectl get svc argocd-server -n argocd
kubectl get all -n argocd

# Limpeza
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
helm uninstall argocd -n argocd
kubectl delete namespace argocd