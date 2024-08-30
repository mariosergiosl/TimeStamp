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

  kubectl apply -f argocd/devops-server_app.yaml
  kubectl apply -f devops-server_service.yaml -n default
kubectl apply -f devops-server_ingress.yaml -n default
