#!/bin/bash
helm repo add k8ssandra https://helm.k8ssandra.io/
helm repo update
helm install k8ssandra k8ssandra/k8ssandra-operator --namespace k8ssandra-operator --create-namespace 
kubectl apply -f projeto/database/cassandra-datacenter.yaml
kubectl get cassandradatacenter -n default
kubectl get pods -n default