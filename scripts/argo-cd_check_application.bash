#/bin/bash
kubectl get pods -l app=devops-server
kubectl get services devops-server
kubectl logs -l app=devops-server
