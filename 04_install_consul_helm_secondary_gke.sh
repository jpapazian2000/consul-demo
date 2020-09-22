#!/bin/sh
set -o xtrace
source .env
context="gke_${GCP_PROJECT}_${GCP_COMPUTE_ZONE}_${GCP_GKE_NAME}"
kubectl config use-context $context

#apply the federation secret
kubectl apply -f consul-federation-secret.yaml

helm install $CONSUL_HELM_NAME hashicorp/consul -f $CONSUL_HELM_GKE_VALUES
#helm delete $CONSUL_HELM_NAME -n $CONSUL_NAMESPACE

echo "wait to get the public IP for the consul-ui service/n "
echo "Once External IP is assigned ..use a browser to check consul UI  "
echo "press ctrl+c to quit"
kubectl get svc -o wide

#export the federation secret that will be used in the aks cluster
kubectl get secret consul-federation -o yaml > consul-federation-secret.yaml
kubectl get pods

