#!/bin/sh
set -o xtrace
echo "Scaling webapp from 3 to 5 replicas"
kubectl scale --replicas=5 deployment/web -n=consul
echo "Browse the nginx_lb again to see new IPs appear"
kubectl get pods -o wide | grep web
kubectl get svc -o wide | grep nginx-lb
echo "NGINX load balancer was automatically configured using consul-template"
