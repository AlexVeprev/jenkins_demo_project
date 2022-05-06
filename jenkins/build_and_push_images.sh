#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

USER=$1
TOKEN=$2
echo ${TOKEN} | docker login ghcr.io -u ${USER} --password-stdin

set -e -x

function preare_image() {
    DOCKERFILE=$1
    IMAGE_TAG=$2

    docker build -f ${SCRIPTPATH}/${DOCKERFILE} -t ghcr.io/${USER}/jenkins_demo_project/${IMAGE_TAG} .
    docker push ghcr.io/${USER}/jenkins_demo_project/${IMAGE_TAG}
    #docker rmi ghcr.io/${USER}/jenkins_demo_project/${IMAGE_TAG}
}

#preare_image Dockerfile.builder     demo_builder:latest
#preare_image Dockerfile.tester_deb  demo_tester:deb
#preare_image Dockerfile.tester_ub18 demo_tester:ub18
#preare_image Dockerfile.tester_ub20 demo_tester:ub20
#preare_image Dockerfile.tester_ub22 demo_tester:ub22

# For Docker Cloud
preare_image Dockerfile.agent_builder     demo_jenkins_agent_builder:latest
preare_image Dockerfile.agent_tester_deb  demo_jenkins_agent_tester:deb
preare_image Dockerfile.agent_tester_ub18 demo_jenkins_agent_tester:ub18
preare_image Dockerfile.agent_tester_ub20 demo_jenkins_agent_tester:ub20
preare_image Dockerfile.agent_tester_ub22 demo_jenkins_agent_tester:ub22

docker logout
