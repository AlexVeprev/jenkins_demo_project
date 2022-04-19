FROM ubuntu:20.04
RUN apt update && \
    apt install -y cmake g++ wget gnupg && \
    wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB && \
    apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB && \
    rm GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB && \
    echo "deb https://apt.repos.intel.com/oneapi all main" | tee /etc/apt/sources.list.d/oneAPI.list && \
    apt update && \
    apt instal -y intel-oneapi-tbb-devel-2021.5.0
