#!/usr/bin/env bash

# Default login: ssh -i ~/.ssh/id_rsa admin@api.k8s2.squads-dev.com
# ssh-add ~/.ssh/devops_aws_rsa
# ssh admin@api.k8s2.squads-dev.com
# sudo cat /srv/kubernetes/known_tokens.csv | grep kube,kube

API_SERVER="https://api.sspcloudpro.co.in"
TOKEN="GhkQexRu2lG53oYLm9HTAwarz8QVZrhe"
CLUSTER_NAME="sspcloudpro.co.in"

kubectl config set preferences.colors true

kubectl config set-cluster ${CLUSTER_NAME} --server=${API_SERVER} --insecure-skip-tls-verify=true --namespace default
kubectl config set-credentials ${CLUSTER_NAME} --token=${TOKEN} --namespace default

# Set context to new root cluster
kubectl config set-context ${CLUSTER_NAME} --namespace default

# Print all contexts
kubectl config get-contexts
kubectl get ns
