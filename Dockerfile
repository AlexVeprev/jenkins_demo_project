FROM ubuntu:20.04
RUN apt update && \
    apt -y install cmake g++ && \
    useradd -ms /bin/bash jenkins
USER jenkins
WORKDIR /home/jenkins
