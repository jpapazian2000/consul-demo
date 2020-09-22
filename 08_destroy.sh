#!/bin/sh
set -o xtrace
source .env
gke_context="gke_${GCP_PROJECT}_${GCP_COMPUTE_ZONE}_${GCP_GKE_NAME}"
aks_context=$AKS_CLUSTER_NAME

kubectl config use-context $gke_context
gcloud container clusters delete $GCP_GKE_NAME

kubectl config use-context $aks_context
az group delete --name $AZ_RESOURCE_GROUP --yes --no-wait
 rm -f consul-federation-secret.yaml

