#!/bin/sh
set -o xtrace

context="$AKS_CLUSTER_NAME"
kubectl config use-context $context

kubectl apply -f nginx_lb_with_consul_template.yaml 
echo "wait to get the public IP for the nginx-lb service/n "

echo "press ctrl+c to quit"

kubectl get svc -o wide -w
kubectl get pods -o wide | grep web
kubectl get svc -o wide | grep nginx-lb

echo "Once External IP for nginx-lb is assigned ..use a browser to check Web-app, refresh to see the load balancer in action  "
