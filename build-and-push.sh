#!/bin/bash
set -e

DOCKERHUB_USERNAME="k1922"
GITHUB_USERNAME="K-M-1922"
REPO_NAME="comfyui-z-image-turbo"
IMAGE_TAG="latest"

echo "Cloning repo..."
git clone https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git
cd ${REPO_NAME}

echo "Logging in to Docker Hub..."
docker login -u ${DOCKERHUB_USERNAME}

echo "Building Docker image..."
docker build \
    --platform linux/amd64 \
    -t ${DOCKERHUB_USERNAME}/${REPO_NAME}:${IMAGE_TAG} \
    .

echo "Pushing image to Docker Hub..."
docker push ${DOCKERHUB_USERNAME}/${REPO_NAME}:${IMAGE_TAG}

echo "Done."
echo "Use this image in RunPod:"
echo "${DOCKERHUB_USERNAME}/${REPO_NAME}:${IMAGE_TAG}"
