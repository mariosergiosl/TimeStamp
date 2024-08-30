#!/bin/bash

# Verificar se a branch 'main' existe
if ! git show-ref --verify --quiet refs/heads/main; then
  # Se não existir, criar a branch 'main'
  git checkout -b main
fi

# Adicionar os arquivos ao repositório
git add .

# Fazer o commit
git commit -m "Update"

# Verificar se o remote 'origin' já existe
if ! git remote get-url origin &> /dev/null; then
  # Se não existir, adicionar o remote
  git remote add origin https://gitlab.com/mario_luz/desafio-devops.git
fi

# Prompt for GitLab username
#read -p "Username for 'https://gitlab.com': " username

# Prompt for GitLab PAT
#read -s -p "Password for 'https://${username}@gitlab.com': " pat
#echo  # Add a newline after the password prompt

# Set Git credentials temporarily for this session
#git config --local credential.helper 'store --file=.git/credentials'
#echo "https://${username}:${pat}@gitlab.com" > .git/credentials


# Enviar as alterações para o GitLab (forçando o push na primeira vez)
# git push -u origin main --force


# Enviar as alterações para o GitLab (forçando o push na primeira vez)
git push -u origin main || git push -u origin main -f

# Remove the temporary credentials file
# rm .git/credentials
