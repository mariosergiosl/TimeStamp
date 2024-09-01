#!/bin/bash

# Adicionar o repositório oficial do GitLab Runner
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash

# Instalar o GitLab Runner
apt-get install gitlab-runner

#Obter o token de registro:

#No seu projeto GitLab, vá em Settings > CI/CD > Runners.
#Na seção Set up a specific Runner manually, copie o URL e o token de registro.

gitlab-runner register  --url https://gitlab.com  --token glrt-YOUR-RUNNER-TOKEN-PLACEHOLDER

