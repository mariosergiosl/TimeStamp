#/bin/bash
helm repo add datastax https://datastax.github.io/helm-charts
helm repo update
helm install cass-operator datastax/cass-operator --set global.imagePullSecrets[0].name=seu-image-pull-secret --namespace cass-operator --create-namespace 
kubectl apply -f cassandra-datacenter.yaml
kubectl get cassandradatacenter -n default
kubectl get pods -n default
