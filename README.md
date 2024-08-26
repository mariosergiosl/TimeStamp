# Desafio DevOps

Este projeto é uma solução para o Desafio DevOps proposto, que envolve a construção e implantação de uma aplicação Python em um cluster Kubernetes, utilizando tecnologias como Docker, GitLab CI/CD, Cassandra/ScyllaDB, Kong e ArgoCD.

## Estrutura do Projeto


projeto/
├── README.md
├── app/
│   └── devops-server.py
├── docker/
│   └── Dockerfile
├── k8s/
├── charts/
│   └── devops-server/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│           └── deployment.yaml
├── ci-cd/
│   └── .gitlab-ci.yml
├── database/
│   └── cassandra-datacenter.yaml
├── kong/
│   ├── kong_configure_router.bash
│   └── kong_test_router.bash
├── argocd/
│   └── application.yaml
├── scripts/
│   ├── argo-cd_apply_application.bash
│   ├── argo-cd_check_application.bash
│   ├── argo-cd_install.bash
│   ├── cassandra-install.bash
│   ├── docker-pull.bash
│   ├── k3s-install.bash
│   └── kong-install.bash
└── docs/
├── procedimento_utilizacao.md
├── configuracao_cluster.md
└── configuracao_build.md





## Etapas do Desafio

* **Etapa 1-3:** Criação do container Docker, pipeline GitLab CI e armazenamento da imagem no registro.
* **Etapa 4:** Instalação do cluster Kubernetes (k3s) e configuração do Ingress.
* **Etapa 5:** Provisionamento do banco de dados Cassandra/ScyllaDB no Kubernetes.
* **Etapa 6:** Implantação do Kong no Kubernetes.
* **Etapa 7:** Criação do Helm chart para a aplicação Python e publicação no GitLab.
* **Etapa 8:** Configuração da rota `/devops` no Kong para o serviço Python.
* **Etapa 9:** Automação do deploy com ArgoCD.
* **Etapa 10:** Documentação e apresentação da solução.

## Como Executar

1. Clone este repositório.
2. Siga as instruções nos arquivos de documentação em `docs/` para configurar o ambiente, construir a aplicação, implantar no Kubernetes e configurar o Kong e o ArgoCD.

## Tecnologias Utilizadas

* Python
* Flask
* Docker
* GitLab CI/CD
* Kubernetes (k3s)
* Cassandra/ScyllaDB
* Kong
* ArgoCD
* Helm


## Arquivos Principais do Projeto

    projeto/app/devops-server.py: Este é o código da sua aplicação Flask. Ele parece estar correto, definindo uma rota /devops que retorna um JSON com um UUID. Nenhum ajuste é necessário.

    projeto/docker/Dockerfile: Este Dockerfile é usado para construir a imagem da sua aplicação. Ele também parece estar correto, utilizando uma imagem base Python Alpine, copiando o código para o container, expondo a porta 8080 e definindo o comando para iniciar a aplicação. Nenhum ajuste é necessário.

    projeto/ci-cd/.gitlab-ci.yml: Este é o arquivo de configuração do seu pipeline GitLab CI/CD. Ele define os estágios de build e push para construir e enviar a imagem Docker, e os estágios de package e publish para empacotar e publicar o Helm chart.

    projeto/database/cassandra-datacenter.yaml: Este arquivo define um CassandraDatacenter no Kubernetes, que é usado para implantar um cluster Cassandra. Ele parece estar correto, configurando um cluster de nó único com um PersistentVolumeClaim para armazenamento. Nenhum ajuste é necessário.

    projeto/k8s/values.yaml: Este arquivo values.yaml parece estar fora de contexto, já que não há nenhum Helm chart na pasta k8s. Se você não estiver usando este arquivo para nenhum outro propósito, pode removê-lo. Caso contrário, mova-o para um local mais apropriado ou renomeie-o para evitar confusão.

## Arquivos do Helm Chart

    projeto/charts/devops-server/Chart.yaml: Este arquivo contém metadados sobre o seu Helm chart, como nome, versão e descrição. Certifique-se de que o name e o appVersion estejam corretos e reflitam o nome da sua aplicação. Se você renomeou a pasta do chart para devops-server, ajuste o name para devops-server também.

    projeto/charts/devops-server/values.yaml: Este arquivo define os valores configuráveis do seu Helm chart. Ele parece estar correto, definindo a imagem do Docker, o tipo de serviço, a porta e os recursos. No entanto, certifique-se de que o repository da imagem esteja correto e reflita o caminho da sua imagem no registro do GitLab.

    projeto/templates/deployment.yaml: Este é o template do Deployment que o Helm usará para gerar o manifesto Kubernetes. Ele parece estar correto, usando os valores do values.yaml para configurar o Deployment. Certifique-se de que a containerPort esteja correta (8080, de acordo com o seu código Python).

## Scripts Auxiliares

    projeto/scripts/argo-cd_apply_application.bash: Este script aplica o arquivo application.yaml para criar a aplicação no ArgoCD. Ele está correto.

    projeto/scripts/argo-cd_check_application.bash: Este script verifica o status da aplicação no Kubernetes usando kubectl. Ele está correto.

    projeto/scripts/argo-cd_install.bash: Este script instala o ArgoCD usando o Helm. Ele está correto.

    projeto/scripts/cassandra-install.bash: Este script instala o operador Cassandra e aplica o arquivo cassandra-datacenter.yaml. Certifique-se de que o nome do imagePullSecret esteja correto.

    projeto/scripts/docker-pull.bash: Este script faz login no registro do GitLab e faz o pull da sua imagem Docker. Certifique-se de que o nome de usuário e o token de deploy estejam corretos.

    projeto/scripts/k3s-install.bash: Este script instala o k3s e configura o Ingress NGINX. Ele está correto.

    projeto/scripts/kong-install.bash: Este script instala o Kong usando o Helm. Ele está correto.

## Outros Arquivos

    projeto/kong/kong_configure_router.bash: Este script configura uma rota no Kong para o seu serviço. Certifique-se de que o name do serviço esteja correto (deve corresponder ao nome no seu deployment.yaml) e que a port esteja correta (80, de acordo com o seu values.yaml).

    projeto/kong/kong_test_router.bash: Este script testa a rota configurada no Kong. Certifique-se de que o endereço do seu Kong Ingress esteja correto.

    projeto/argocd/application.yaml: Este arquivo configura a aplicação no ArgoCD para sincronizar com o seu Helm chart. Certifique-se de que o repoURL, o path e o chart estejam corretos, refletindo o seu projeto GitLab e o nome do seu chart.

    projeto/README.md: Este arquivo fornece informações gerais sobre o projeto. Certifique-se de que ele esteja atualizado e reflita a estrutura e os objetivos do seu projeto.


## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests.