# Project to try Jenkins basics

**Goal**: repeat the same workflow as https://github.com/AlexVeprev/github_actions_demo_project

**Status**: done

# General links

- [Pipeline Syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)
- Video [Complete Jenkins Pipeline Tutorial | Jenkinsfile explained](https://www.youtube.com/watch?v=7KCS70sCoK0)

# Instruction

1. Configure 2-3 or more VMs:
     - For Jenkins controller (master).
     - For Jenkins agent(s).
     - For Docker server(s), i.e. Docker Cloud (item 4 below and option 3 in `Jenkinsfile`).

2. Install Jenkins controller. E.g. using Docker. Follow this [instruction](https://www.jenkins.io/doc/book/installing/docker/), skip running `docker:dind`.

   _Install additional plugins:_
     - https://plugins.jenkins.io/http_request/
     - https://plugins.jenkins.io/pipeline-utility-steps/
     - https://plugins.jenkins.io/credentials/
     - ???

3. Configure Jenkins agent(s):
   1. Install jre and docker.
   2. Create user "jenkins", allow him to use Docker.
   3. Create ssh-key pair (doesn't matter what host to use for this) and store _public key_ in ~/.ssh/authorized_keys of Jenkins agent, add _private key_ as Credential using Jenkins UI (Manage Credentials).
   4. Configure agent through Jenkins UI.

4. As alternative (or addition) to statically configured Jenkins agent(s) from item 3 configure Docker Cloud using [Jenkins Docker Plugin](https://plugins.jenkins.io/docker-plugin/) to create Jenkins agents dynamically:
   1. Install Docker to host and [configure](https://plugins.jenkins.io/docker-plugin/#plugin-content-docker-environment) it.
   2. Prepare Docker images for dynamic runners, images should contain jre (see examples in `jenkins/Dockerfile.agent_*`.
   3. Configure Docker Cloud through Jenkins UI.

4. Create project for GitHub; you'll need to add personal access token and some other secrets (see Jenkinsfile) to Credentials.

TODOs: 
- [ ] Prepare more precise Dockerfile for Jenkins controller with all the needed plugins.
- [ ] Prepare more optimized (from size perspective) Docker images for builder and testers (including images with for dynamic agents).
- [ ] Describe steps more precisely where makes sense.
