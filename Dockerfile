FROM ubuntu:20.04
RUN apt update && \
    apt -y install sudo cmake g++ && \
    useradd -ms /bin/bash jenkins && \
    adduser jenkins sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER jenkins
WORKDIR /home/jenkins
