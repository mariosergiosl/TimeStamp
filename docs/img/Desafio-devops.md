Desafio DevOps

O objetivo deste desafio é ajudar os profissionais de DevOps a terem contato com as tecnologias utilizadas no projeto, para tal sugerimos fazer fork do projeto https://gitlab.com/timestamp-si/challenges/desafio-devops, se possível criar um repo privado.

O desafio é dividido nas seguintes etapas:

    Criar container com aplicação em Python (presente neste repositório)
        Artefatos esperados:
            dockerfile
        Dica:
            utilizar como base um imagem Python alpine para reduziro tamanho da imagem resultado
    Criar pipeline para build do container com Gitlab CI
        Artefatos esperados:
            ficheiro gitlab-ci.yml
            pipeline executado no Gitlab com sucesso
        Dica:
            configure um runner no próprio desktop para build de containers.
    Armazenar container gerado no registry do Gitlab
        Artefatos esperados:
            imagem no registry do Gitlab
            resolução da imagem com docker pull
        Dica:
            Utilize deployment tokens para autenticar dentro da pipeline.
            Se o runner for Linux pode-se utilizar podman ao invés de docker.
    Instalar cluster Kubernetes
        Artefatos esperados:
            Instalação Kubernetes em execução
            extra: configurar add-on ingress
        Dica:
            Opções para desktop: minikube, kind e k3s
    Disponibilizar base de dados Cassandra/ScyllaDB no Kubernetes
        Artefatos esperados:
            Base de dados Cassandra/ScyllaDB a correr no Kubernetes
        Dica:
            Entenda Kubernetes operators
            Utilizar ring single Node para econimizar recursos
    Disponibilizar Kong no Kubernetes
        Artefatos esperados:
            API gateway Kong em execução no Kubernetes
            Persistência preferencial Cassandra/ScyllaDB, opcional configMap
            extra: configurar entrada como ingress
    Disponibilizar aplicação Python no Kubernetes
        Artefatos esperados:
            Aplicação Python a correr no Kubernetes
        Dica:
            Criar Helm chart para aplicação
            Salvar Helm chart nos artefatos do Gitlab e puclicar uma URL para utilizadores
    Configurar rota /devops no Kong para encaminhar requisições para container Python
        Artefatos esperados:
            Requisições ao Kubernetes com /devops invocar container Python deve retornar {"uuid": "71477d86-afba-400e-8766-40bbeccdba35"}
        Dica:
            Configurar strip_path=false
    Automatizar procedimento de deploy com ArgoCD
        Artefatos esperados:
            ArgoCD instalado no cluters Kubernetes
            ArgoCD configurado para disponibilizar a aplicação no cluster com o Helm chart publicado
        Dica:
            Documento formato markdown com procedimento a ser seguido
    Documentação:
        Artefatos esperados:
            Conjunto de ficheiros MarkDown com:
                o procedimento de utilização da aplucação (encontrar o IP do cluster e fazer curls para o endpoint configurado)
                o procedimento de configuração do cluster e exposição na rede
                o procedimento de configuração do build da aplicação com runner e disponibilização de artefatos
    Apresentação
        Artefatos esperados:
            Apresentação da implementação proposta com recional sobre decisões feitas à equipa DevOps do S3
            Repostas às questões sobre a solução proposta
