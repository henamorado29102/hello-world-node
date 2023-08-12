docker ps -q --filter "name=hello-world-node-prod" | docker stop hello-world-node-prod && docker rm -fv hello-world-node-prod

docker rmi $(docker images henamorado/hello-world-node:lastest)

docker pull henamorado/hello-world-node

docker run --name=hello-world-node-prod  -d -p 89:3000 henamorado/hello-world-node