#!/bin/bash
apt-get update && apt-get -y upgrade
# get latest stable version of kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# place generated kubeconfig to this directory
mkdir -p /root/.kube
# get helm binary
curl -LO "https://get.helm.sh/helm-v3.8.2-linux-amd64.tar.gz"
tar xf helm-v3.8.2-linux-amd64.tar.gz
install -o root -g root -m 0755 ./linux-amd64/helm /usr/local/bin/helm
