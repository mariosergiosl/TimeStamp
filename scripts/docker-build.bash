docker build -t desafio-devops:1.2 -f docker/Dockerfile .
docker run -p 12080:12080 desafio-devops:1.2