FROM ubuntu:16.04

RUN apt-get update -qq
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

RUN add-apt-repository -y ppa:ansible/ansible
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN add-apt-repository "deb http://packages.cloud.google.com/apt cloud-sdk-xenial main"

RUN apt-get update -qq
RUN apt-get install -y --allow-unauthenticated docker-ce
RUN apt-get install -y ansible python python-pip
RUN apt-get install -y google-cloud-sdk jq
RUN pip install jmespath netaddr botocore boto boto3 google-auth pyVim pyVmomi requests

# install latest git
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update -qq && apt-get install -y git