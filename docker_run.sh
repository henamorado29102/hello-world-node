docker ps -q --filter "name=hello-world-node-prod" | docker stop hello-world-node-prod && docker rm -fv hello-world-node-prod

docker pull henamorado/hello-world-node

docker rmi $(docker images -f "dangling=true" -q)

docker run --name=hello-world-node-prod  -d -p 80:3000 henamorado/hello-world-node