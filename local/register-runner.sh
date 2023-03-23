#! /bin/bash -x

#ssh -fNT -L localhost:3377:/var/run/docker.sock 10.49.139.220

TOKEN=$(pass gitlab.ista.com/runner_token_cicd_deployments_tools_harbor)

HOSTNAME=$(hostname)
USER=$(whoami)
RUNNER_NAME="localtest - ${USER} - ${HOSTNAME}"
TAG_LIST="KIND-TEST"

### fixed Values
GITLAB_URL="https://gitlab.ista.net/"


docker-compose exec -T gitlab-runner \
    gitlab-runner \
    register \
    --non-interactive \
    --url "${GITLAB_URL}" \
    --name "${RUNNER_NAME}" \
    --docker-privileged \
    --tag-list "${TAG_LIST}" \
    --registration-token "${TOKEN}" \
    --maximum-timeout "${TIMEOUT:-21600}" \
    --run-untagged="false" \
    --executor docker \
    --docker-image docker:latest \
    --docker-volumes /var/run/docker.sock:/var/run/docker.sock \
    --request-concurrency 10 \
    --docker-hostname "${RUNNER_NAME}" \
    --docker-memory 6G \
    --docker-memory-swap 6G \
    --docker-memory-reservation 2G \
    --docker-cpuset-cpus 0-3 \
    --docker-network-mode "host" \
    
    # --docker-cap-add value \