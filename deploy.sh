SERVICES=$(docker service ls --filter name=devops_ge --quiet | wc -l)
if [[ "$SERVICES" -eq 0 ]]; then
        docker service create \
          --replicas 2 \
          --name devops_ge \
          --update-parallelism 1 \
          --update-delay 10s \
          --publish 80:80 \
          --restart-condition any \
          registry.devops.ge/devops.ge:latest

fi

docker service update \
        --image registry.devops.ge/devops.ge:$shortCommit \
        --rollback \
        devops_ge
