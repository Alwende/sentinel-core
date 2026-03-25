#!/bin/bash

# --- CONFIGURATION (The "PMO Gold Standard") ---
VERSION="v2.1.0"
REGISTRY_ID="194636598053"
REGION="af-south-1"
REPO_NAME="sentinel-core"
DEPLOYMENT_NAME="sentinel-core-deployment"
IMAGE_URI="${REGISTRY_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPO_NAME}:${VERSION}"

# Exit immediately if a command fails
set -e

echo "🚀 [1/5] Building Local Image: sentinel-core:${VERSION}..."
docker build -t sentinel-core:${VERSION} .

echo "🏷️ [2/5] Tagging for Cape Town ECR..."
docker tag sentinel-core:${VERSION} ${IMAGE_URI}

echo "🔐 [3/5] Authenticating with Cape Town Registry..."
aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${REGISTRY_ID}.dkr.ecr.${REGION}.amazonaws.com

echo "📤 [4/5] Pushing Payload to South Africa..."
docker push ${IMAGE_URI}

echo "☸️ [5/5] Updating EKS Cluster..."
kubectl set image deployment/${DEPLOYMENT_NAME} sentinel-container=${IMAGE_URI}

echo "✅ [SUCCESS] v${VERSION} is now rolling out in Cape Town!"
kubectl get pods
