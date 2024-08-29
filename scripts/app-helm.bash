# Executando helm no windws dentro do MobaXterm -- Verificar compatibilidades
# helm package charts/devops-server -f charts/devops-server/values.yaml --app-version 0.1.0
# helm package charts/devops-server --values charts/devops-server/values.yaml --app-version 0.1.0
# helm package charts/devops-server --set image.repository=registry.gitlab.com/mario_luz/desafio-devops --app-version 0.1.0


helm package charts/devops-server --app-version 0.1.0
# Successfully packaged chart and saved it to: D:\Downloads\TimeStamp\desafio-devops\devops-server-0.1.0.tgz