# Configuração do Build da Aplicação com Runner e Disponibilização de Artefatos

Este documento descreve como configurar o build da aplicação Python com um runner do GitLab CI/CD e disponibilizar os artefatos gerados (imagem Docker e Helm chart).

## Configuração do Runner

1. **Instale um runner do GitLab CI/CD no seu ambiente local.** Consulte a documentação do GitLab para obter instruções detalhadas.
2. **Registre o runner no seu projeto GitLab.** Certifique-se de que o runner tenha as permissões necessárias para executar os jobs do pipeline.

## Configuração do Pipeline (.gitlab-ci.yml)

O arquivo `.gitlab-ci.yml` na raiz do projeto define o pipeline de CI/CD. Ele contém as seguintes etapas:

* **build:** Constrói a imagem Docker da aplicação Python.
* **push:** Envia a imagem para o registro do GitLab.
* **package:** Empacota o Helm chart da aplicação.
* **publish:** Publica o Helm chart no registro do GitLab e o disponibiliza como um artefato do pipeline.

## Variáveis de Ambiente

Configure as seguintes variáveis de ambiente no seu projeto GitLab:

* `IMAGE_NAME`: O nome da sua imagem Docker no registro do GitLab (por exemplo, `seu-usuario/devops-server`).
* `CI_REGISTRY_USER`: Seu nome de usuário no GitLab.
* `CI_REGISTRY_PASSWORD`: Seu token de acesso pessoal ou um token de deploy do GitLab.

## Executando o Pipeline

1. Faça commit das suas alterações no repositório GitLab.
2. O pipeline será executado automaticamente. Você pode acompanhar o progresso na interface do GitLab.
3. Após a conclusão do pipeline, a imagem Docker estará disponível no registro do GitLab e o Helm chart poderá ser baixado como um artefato do pipeline.