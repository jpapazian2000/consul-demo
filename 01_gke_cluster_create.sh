#!/bin/sh
set -o xtrace
source .env
#dc01 create GKE 3 node cluster in west europe
gcloud config set project $GCP_PROJECT
gcloud config set compute/zone $GCP_COMPUTE_ZONE
gcloud container clusters create $GCP_GKE_NAME --num-nodes=$GCP_GKE_NUM_NODES --machine-type=$GCP_MACHINE_TYPE
gcloud container clusters get-credentials $GCP_GKE_NAME
