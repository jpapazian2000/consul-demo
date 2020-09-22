#!/bin/bash

set -o xtrace

source .env

#create resource group
az group create --name $AZ_RESOURCE_GROUP --location $AKS_LOCATION

#create cluster
az aks create --resource-group $AZ_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --node-count 3 --generate-ssh-keys

#generatie context entry for kubectl into $HOME/.kube/config
az aks get-credentials --resource-group $AZ_RESOURCE_GROUP --name $AKS_CLUSTER_NAME

#set context to aks cluster
kubectl config use-context $AKS_CLUSTER_NAME
