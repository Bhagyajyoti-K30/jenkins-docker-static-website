#!/bin/bash
IMAGE_NAME=static-website:latest
CONTAINER_NAME=website-container

# Stop and remove existing container
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

# Build Docker image
docker build -t $IMAGE_NAME .

# Run Docker container
docker run -d -p 80:80 --name $CONTAINER_NAME $IMAGE_NAME

echo "Deployment completed successfully!"
