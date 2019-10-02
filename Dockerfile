FROM ubuntu:16.04

RUN apt-get update -qq
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN sudo add-apt-repository -y ppa:ansible/ansible
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get update -qq
RUN apt-get install -y --allow-unauthenticated docker-ce
RUN apt-get install -y ansible python python-pip
RUN install jmespath netaddr botocore boto boto3 google-auth pyVim pyVmomi requests
