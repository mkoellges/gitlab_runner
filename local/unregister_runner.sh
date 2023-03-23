#! /bin/bash -x

TOKEN=$(pass gitlab.ista.com/runner_token_cicd_deployments_tools_harbor)

### fixed Values
GITLAB_URL="https://gitlab.ista.net/"


docker-compose exec -T gitlab-runner \
    gitlab-runner \
    unregister \
    -u "${GITLAB_URL}" \
    -t "${TOKEN}" \
    --all-runners