#! /bin/bash -x

#ssh -fNT -L localhost:3377:/var/run/docker.sock 10.49.139.220

# SERVER_URL="https://gitlab.ista.net/"
SERVER_URL="https://gitlab.com/"
export SERVER_URL
# TOKEN=$(pass gitlab.ista.com/runner_token_cicd_deployments_tools_harbor)
TOKEN=$(pass gitlab.con/aks_runner_token)
export TOKEN

HOSTNAME=$(hostname)
USER=$(whoami)
export RUNNER_NAME="localtest - ${USER} - ${HOSTNAME}"
export TAG_LIST="isdp-runner"

docker-compose ps 
docker compose up -d
docker-compose ps

# docker compose down