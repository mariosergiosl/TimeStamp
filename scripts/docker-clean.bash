docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker volume prune
docker rmi $(docker ps -a --format '{{.Image}}')