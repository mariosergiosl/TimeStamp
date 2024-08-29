#!/bin/bash
kubectl apply -f database/cassandra-statefulset.yaml
kubectl apply -f database/cassandra-service.yaml

# -------------------- DEBUG
# kubectl get statefulset cassandra
# kubectl get pod cassandra-0
# kubectl get pods -l app=cassandra
# kubectl logs cassandra-0
# kubectl logs cassandra-0 -f
# kubectl describe statefulset cassandra
# kubectl describe pod cassandra-0
# kubectl describe service cassandra
# kubectl get statefulset cassandra
# kubectl get service cassandra

# kubectl rollout restart statefulset cassandra

# -------------------- TESTE
# kubectl exec -it cassandra-0 -- bash
# kubectl exec -it cassandra-0 -n default -- bash
# apt-get update
# apt-get install -y vim
# vim /etc/cassandra/cassandra.yaml
# kubectl exec -it cassandra-0 -- cqlsh
# SELECT cluster_name FROM system.local;

# -------------------- LIMPEZA
# kubectl delete statefulset cassandra
# kubectl delete service cassandra
# kubectl delete pvc -l app=cassandra
