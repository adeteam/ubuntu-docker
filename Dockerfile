FROM ubuntu:16.04

RUN apt-get update -qq
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN add-apt-repository "deb http://packages.cloud.google.com/apt cloud-sdk-xenial main"

RUN apt-get update -qq
RUN apt-get install -y --allow-unauthenticated docker-ce
RUN apt-get install -y google-cloud-sdk jq
RUN apt-get install -y python3 python3-pip python3-apt libssl-dev
RUN pip3 install ansible==2.9.4
RUN pip3 install jmespath netaddr botocore boto boto3 google-auth pyVim pyVmomi requests

# install latest git
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update -qq && apt-get install -y git

# remove and clean up apt
RUN add-apt-repository -r "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN add-apt-repository -r "deb http://packages.cloud.google.com/apt cloud-sdk-xenial main"
RUN apt-get update -qq || true
RUN apt autoremove --purge || true
RUN rm -rf /var/lib/apt/lists/*
RUN apt clean || true
RUN rm -rf /tmp/*