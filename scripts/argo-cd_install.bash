#/bin/bash
cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
export KUBECONFIG=~/.kube/config

#Configuração
kubectl create namespace argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
#helm install argocd argo/argo-cd -n argocd --set server.insecure=true
kubectl apply -n argocd -f argocd/argocd-install.yaml
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
kubectl apply -f argocd/argocd-service.yaml -n argocd
kubectl apply -f argocd/argocd-ingess.yaml -n argocd
#Edite o serviço para usar o tipo NodePort e expor a porta 80 no NodePort 30080:
kubectl edit svc argocd-server -n argocd
DEVE ESTAR ASSIM
spec:
  clusterIP: 10.43.123.170
  clusterIPs:
  - 10.43.123.170
  externalTrafficPolicy: Cluster
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - name: http
    nodePort: 30080
    port: 80
    protocol: TCP
    targetPort: 8080
  selector:
    app.kubernetes.io/name: argocd-server
  sessionAffinity: None
  type: NodePort
status:
  loadBalancer: {}


#Edite o ConfigMap argocd-cmd-params-cm para incluir a configuração server.insecure: "true"
kubectl edit configmap argocd-cmd-params-cm -n argocd
#Adicione a seguinte linha na seção data: server.insecure: "true" 
kubectl delete secret argocd-secret -n argocd
kubectl create secret generic argocd-secret -n argocd --from-literal=secretkey=t+m2HG9PfwlSIh1EjjBwWfBm9Kaoj5eOTEJa3TZ2rhk=
kubectl delete pod -n argocd -l app.kubernetes.io/name=argocd-server

#Verificação
kubectl get configmap argocd-cmd-params-cm -n argocd -o yaml
| grep server.insecure: "true"
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server
kubectl logs -n argocd <nome_do_pod_argocd-server>
curl http://192.168.1.4:30080/

kubectl get svc argocd-server -n argocd
kubectl get svc argocd-server -n argocd -o jsonpath='{.spec.clusterIP}'
kubectl run -it --rm --restart=Never --image=curlimages/curl --namespace=default curl-test -- sh -c "curl http://10.43.55.100:80"
curl http://<argocd-server-cluster-ip>:80

# Limpeza
helm uninstall argocd -n argocd
kubectl delete namespace argocd
kubectl get all -A | grep argo

# Exclui todos os pods, replicaSets e deployments no namespace `default` que contenham "argo" no nome
kubectl delete pod,replicaset,deployment -n default -l 'app.kubernetes.io/name in (argocd-application-controller, argocd-applicationset-controller, argocd-dex-server, argocd-notifications-controller, argocd-redis, argocd-repo-server, argocd-server)'

# Exclui todos os serviços no namespace `default` que contenham "argo" no nome
kubectl delete svc -n default -l 'app.kubernetes.io/name in (argocd-applicationset-controller, argocd-dex-server, argocd-metrics, argocd-notifications-controller-metrics, argocd-redis, argocd-repo-server, argocd-server, argocd-server-metrics)'

# Exclui o statefulset `argocd-application-controller` no namespace `default`
kubectl delete statefulset argocd-application-controller -n default

# Exclui todos os recursos (pods, deployments, services, etc.) no namespace `argocd`
kubectl delete all --all -n argocd

