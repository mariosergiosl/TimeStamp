#/bin/bash
helm repo add kong https://charts.konghq.com
helm repo update
helm install kong kong/kong 
helm install kong kong/kong --namespace kong --create-namespace -f kong/kong-values.yaml
kubectl apply -f kong/kong-ingress.yaml
kubectl get svc -n kong kong-kong-admin -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
kubectl port-forward -n kong svc/kong-kong-admin 8001:8001