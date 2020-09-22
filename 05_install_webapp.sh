#!/bin/sh
set -o xtrace
context="$AKS_CLUSTER_NAME"
kubectl config use-context $context

echo "deploying webapp with 3 replicas"
kubectl apply -f web.yaml 

echo "press ctrl +c to quit"
kubectl get pods -o wide -w 
kubectl get pods -o wide  | grep web
echo "Note the IPs of the Pods"

