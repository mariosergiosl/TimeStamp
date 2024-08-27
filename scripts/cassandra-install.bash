#!/bin/bash
helm repo add k8ssandra https://helm.k8ssandra.io/stable
helm repo update




helm install k8ssandra k8ssandra/k8ssandra-operator --namespace k8ssandra-operator --create-namespace 

# testar o operador:
# kubectl wait --for=condition=Ready pods --all -n k8ssandra-operator --timeout=60s

kubectl create namespace cassandra

kubectl apply -f database/cassandra-datacenter.yaml -n cassandra
kubectl get cassandradatacenter -n default
kubectl get pods -n default