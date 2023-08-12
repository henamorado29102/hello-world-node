if docker container inspect hello-world-node >/dev/null 2>&1; then
  docker stop hello-world-node
  docker rm hello-world-node
fi

docker pull henamorado/hello-world-node

docker run --name=hello-world-node  -d -p 80:3000 henamorado/hello-world-node