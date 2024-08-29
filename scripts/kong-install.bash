#/bin/bash
kubectl apply -f kong/kong-statefulset.yaml
kubectl apply -f kong/kong-service.yaml
kubectl get pods -l app=kong -o wide | awk '{print $6}'
kubectl get svc kong-proxy -n default -o yaml