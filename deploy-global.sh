#!/bin/bash
set -e # This line ensures the script stops immediately if any command fails

VERSION="v2.2.0-1774475058"
GCP_CONTEXT="gke_charming-scarab-474407-i8_us-central1-a_sentinel-production-cluster"
AWS_CONTEXT="sentinel-deployer@sentinel-eks-capetown.af-south-1.eksctl.io"

echo "🛠️ [1/4] Internal Path Sync..."
cp app.py dashboard/app.py

echo "📦 [2/4] Building Clean Image (using SLIM)..."
docker build --no-cache -t sentinel-core:$VERSION .

echo "📤 [3/4] Dual-Registry Push..."
docker tag sentinel-core:$VERSION 194636598053.dkr.ecr.af-south-1.amazonaws.com/sentinel-core:$VERSION
docker push 194636598053.dkr.ecr.af-south-1.amazonaws.com/sentinel-core:$VERSION

docker tag sentinel-core:$VERSION gcr.io/charming-scarab-474407-i8/sentinel-core:$VERSION
docker push gcr.io/charming-scarab-474407-i8/sentinel-core:$VERSION

echo "☸️ [4/4] Multi-Cloud Cluster Update..."
kubectl config use-context $AWS_CONTEXT
kubectl apply -f deployment.yml
kubectl rollout restart deployment/sentinel-core-deployment

kubectl config use-context $GCP_CONTEXT
kubectl apply -f deployment.yml
kubectl rollout restart deployment/sentinel-core-deployment

echo "✅ [SUCCESS] v$VERSION is now globally live and identical."
