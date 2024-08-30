#/bin/bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl apply -f argocd/argocd-service.yaml
kubectl apply -f argocd/argocd-application.yaml
kubectl apply -f argocd/argocd-ingress.yaml

# obter a senha inicial
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d


#mudar o type em ports de ClusterIP para NodePort
#kubectl edit svc argocd-server -n argocd

#kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort", "ports": [{"port": 80, "targetPort": 8080, "nodePort": 30080}, {"port": 443, "targetPort": 8080, "nodePort": 30443}]}}'



# Teste
# kubectl get svc argocd-server -n argocd
# kubectl get all -n argocd

# Limpeza
# kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# kubectl delete namespace argocd