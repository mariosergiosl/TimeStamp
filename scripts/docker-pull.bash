#/bin/bash
docker login registry.gitlab.com -u <seu-nome-de-usuario> -p <seu-deployment-token>
docker pull registry.gitlab.com/<seu-nome-de-usuario>/<sua-imagem> 
