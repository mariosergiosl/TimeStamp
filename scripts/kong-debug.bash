# GATO NO KONG PARA CONSEGUIR CONFIGURAR O BANCO DE DADOS:

# TRANSFORMA kong-statefulset.yaml EM DEPLOYMENT
# adicionar um script que não deixa o pod morrer com os erros
# acessar o pod e executar o script de migração do kong
# PASTA GATO


#TESTE
# Reaplicando arquivo values
helm upgrade kong kong/kong --namespace kong -f kong-values.yaml

#DEBUG
# Verificar o estado do StatefulSet do Kong
kubectl get statefulsets kong

# Listar os pods do Kong
kubectl get pods -l app=kong

# Acompanhar os logs do pod kong-0 em tempo real
kubectl logs -n default kong-0 -f

# Obter informações detalhadas sobre o pod kong-0
kubectl describe pod kong-0 -n default

# Listar todos os pods no namespace default
kubectl get pods -n default

# Listar todos os pods no namespace kong
kubectl get pods -n kong

# Listar todos os recursos relacionados ao Kong em todos os namespaces
kubectl get all --all-namespaces | grep kong 

# Acompanhar os logs do pod kong-kong-6f9b4b8d97-89j9g em tempo real
kubectl logs kong-kong-6f9b4b8d97-89j9g -n default

# Obter informações detalhadas sobre o pod kong-kong-76f7678698-9lstd no namespace kong
kubectl describe pod kong-kong-76f7678698-9lstd -n kong

# Acompanhar os logs do pod kong-686c759998-fwn89
kubectl logs -n default kong-686c759998-fwn89

# Executar o script de migração do Kong (bootstrap) dentro do pod kong-0
kubectl exec -it kong-0 -- kong migrations bootstrap

# Executar as migrações do Kong (up) dentro do pod kong-0
kubectl exec -it kong-0 -- kong migrations up

# Acessar um shell interativo dentro do pod kong-0
kubectl exec -it kong-0 -- bash 

# Deletar o pod kong-0
kubectl delete pod kong-0

# Deletar o pod kong-kong-76f7678698-9lstd no namespace kong
kubectl delete pod kong-kong-76f7678698-9lstd -n kong

# Listar os pods do Ingress NGINX
kubectl get pods -n ingress-nginx

# Acompanhar os logs do pod do Ingress NGINX
kubectl logs -n ingress-nginx ingress-nginx-controller-64db88d998-gbck4

#obter o endereço do Ingress:
kubectl get ingress --namespace default kong-kong-admin
kubectl get svc kong-kong-admin -n default
kubectl get svc kong-proxy -n default -o yaml

#LIMPEZA
# Remover o StatefulSet do Kong no namespace default
kubectl delete statefulset kong -n default

# Remover o PVC do Kong no namespace default
kubectl delete pvc kong-pvc -n default

# Remover o PV do Kong
kubectl delete pv kong-pv

# Desinstalar o Kong instalado via Helm (se aplicável)
helm uninstall kong
helm uninstall kong --namespace kong

# Remover o namespace kong
kubectl delete namespace kong

# Remover o Ingress kong-manager no namespace default
kubectl delete ingress kong-manager -n default

# Remover todos os recursos no namespace kong
kubectl delete all --all -n kong 

# Remover todos os PVCs no namespace kong
kubectl delete pvc --all -n kong 

# Remover o namespace kong (novamente, caso ainda exista)
kubectl delete namespace kong 

# Remover todos os recursos no namespace kong-database
kubectl delete all --all -n kong-database 

# Remover todos os PVCs no namespace kong-database
kubectl delete pvc --all -n kong-database 

# Remover o namespace kong-database
kubectl delete namespace kong-database 

# Remover o pod kong-0 no namespace default
kubectl delete pod kong-0 -n default

# Remover o DaemonSet svclb-kong-proxy-d7da280f no namespace kube-system
kubectl delete daemonset svclb-kong-proxy-d7da280f -n kube-system

# Remover o Service kong-proxy no namespace default
kubectl delete service kong-proxy -n default

# Remover o StatefulSet kong no namespace default (novamente, caso ainda exista)
kubectl delete statefulset kong -n default

# Remover todos os recursos relacionados ao Kong em todos os namespaces
kubectl delete all -l app=kong --all-namespaces


# LIMPEZA DO DOCKER
# Remover imagens não utilizadas
docker image prune

# Remover contêineres parados
docker container prune

# Remover volumes não utilizados
docker volume prune




