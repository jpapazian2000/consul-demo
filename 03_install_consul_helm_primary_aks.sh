#!/bin/sh
set -o xtrace
source .env
context="$AKS_CLUSTER_NAME"
kubectl config use-context $context

#generate the gossip encryption key
#kubectl create secret generic consul-gossip-encryption-key --from-literal=key=$(consul keygen)

#generate the gossip encryption key
kubectl create secret generic consul-gossip-encryption-key --from-literal=key=$(consul keygen)
helm install $CONSUL_HELM_NAME hashicorp/consul -f $CONSUL_HELM_AKS_VALUES
#helm delete $CONSUL_HELM_NAME -n $CONSUL_NAMESPACE

echo "wait to get the public IP for the consul-ui service/n "
echo "Once External IP is assigned ..use a browser to check consul UI  "
echo "press ctrl+c to quit"
kubectl get svc -o wide

#export the federation secret that will be used in the aks cluster
kubectl get secret consul-federation -o yaml > consul-federation-secret.yaml
kubectl get pods

