#!/bin/bash

# Variables
IMAGE_NAME="static-website"
CONTAINER_NAME="static-website-container"

# Build Docker image
docker build -t $IMAGE_NAME .

# Stop and remove existing container if running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Run new container
docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE_NAME

echo "Deployment successful! Website running on port 80."


#Make sure to make this script executable:
chmod +x deploy.sh
