#!/bin/bash

curl -X POST -H "Content-Type: application/json" \
  -d '{
    "apiVersion": "argoproj.io/v1alpha1",
    "kind": "Application",
    "metadata": {
      "name": "minha-app-python",
      "namespace": "argocd"
    },
    "spec": {
      "project": "default",
      "source": {
        "repoURL": "https://gitlab.com/mario_luz/desafio-devops.git", # URL do seu repositório
        "targetRevision": "main",
        "path": "charts/devops-server"  # Caminho para o seu Helm chart
      },
      "destination": {
        "server": "https://kubernetes.default.svc",
        "namespace": "minha-app-python"  # Namespace onde a aplicação será implantada
      }
    }
  }' \
  http://192.168.1.4:30080/api/v1/applications

kubectl create namespace devops-server
kubectl apply -f argocd/devops-server_app.yaml -n devops-server
kubectl apply -f argocd/devops-server_service.yaml -n devops-server
kubectl apply -f argocd/devops-server_ingress.yaml -n devops-server



kubectl get services --all-namespaces -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.type}{"\t"}{range .spec.ports[*]}{.nodePort}{" "}{end}{"\n"}{end}'


# sync da aplicação
#   pegar token
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

#  sync com tokem
#curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer <seu-token>" http://192.168.1.4:30080/api/v1/applications/devops-server/sync

curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer sZOGbalvHyFswFCpr" http://192.168.1.4:30080/api/v1/applications/devops-server/sync

sZOGbalvHyFswFCpr


curl -X POST -H "Content-Type: application/json" -H "Authorization: Basic YWRtaW46c1pPR2JhbHZIeUZzd0ZDcA==" http://192.168.1.4:30080/api/v1/applications/devops-server/sync


kubectl get applications -n argocd


helm install devops-server ./charts/devops-server -n default
helm install devops-server ./charts/devops-server -n default --set image.tag=latest
