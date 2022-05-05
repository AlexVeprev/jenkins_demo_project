# Project to try Jenkins basics

**Goal**: repeat the same workflow as https://github.com/AlexVeprev/github_actions_demo_project

**Status**: done

# Links:

- [Pipeline Syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)
- Video [Complete Jenkins Pipeline Tutorial | Jenkinsfile explained](https://www.youtube.com/watch?v=7KCS70sCoK0)

# Instruction

1. Configure two VMs: for Jenkins controller (master) and Jenkins agent.

2. Install Jenkins controller. E.g. using Docker. Follow this [instruction](https://www.jenkins.io/doc/book/installing/docker/), skip running `docker:dind`.

   _Install additional plugins:_
     - https://plugins.jenkins.io/http_request/
     - https://plugins.jenkins.io/pipeline-utility-steps/
     - https://plugins.jenkins.io/credentials/
     - ???

3. Prepare env for Jenkins agent:
   1. Install jre and docker.
   2. Create user "jenkins", allow him to use Docker.
   3. Create ssh-key pair (doesn't matter what host to use for this) and store _public key_ in ~/.ssh/authorized_keys of Jenkins agent, add _private key_ as Credential using Jenkins UI (Manage Credentials).
   4. Configure agent through Jenkins UI.

4. Create project for GitHub; you'll need to add personal access token and some other secrets (see Jenkinsfile) to Credentials.

TODOs: 
- [ ] Prepare more precise Dockerfile for Jenkins controller with all the needed plugins.
- [ ] Try and describe dynamically created Jenkins agent using Docker Cloud feature: https://plugins.jenkins.io/docker-plugin/
- [ ] Describe steps more precisely where makes sense.
