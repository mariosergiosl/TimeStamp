#!/bin/bash

# Verificar se a branch 'main' existe
if ! git show-ref --verify --quiet refs/heads/main; then
  # Se não existir, criar a branch 'main'
  git checkout -b main
fi

# Adicionar os arquivos ao repositório
git add .

# Fazer o commit
git commit -m "Primeiro commit"

# Verificar se o remote 'origin' já existe
if ! git remote get-url origin &> /dev/null; then
  # Se não existir, adicionar o remote
  git remote add origin https://gitlab.com/mario_luz/desafio-devops.git
fi

# Enviar as alterações para o GitLab (forçando o push na primeira vez)
git push -u origin main --force

