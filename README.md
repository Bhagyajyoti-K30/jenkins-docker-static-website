# Automated Deployment of a Static Website using Jenkins and Docker

## Project Overview
This project demonstrates an automated workflow to deploy a static website using Jenkins, Docker, GitHub, and Linux. The setup includes CI/CD pipeline automation, containerization, and optional monitoring for reliability.

## Tech Stack
- Jenkins  
- GitHub  
- Docker  
- Linux (EC2 instance)  
- Nginx  
- Bash scripting  

## Features
- Continuous integration and deployment triggered by GitHub webhooks on code push.
- Docker containerization of the static website.
- Automated Jenkins pipeline to build, tag, and run Docker images.
- Website served via Nginx inside Docker container.
- Post-build notifications for deployment status.

## Steps Implemented
Step 1: Prepare the Static Website. Create a simple static website using HTML, CSS, and JavaScript. Store all website files in a GitHub repository for version control.

Step 2: Set Up the Linux Server
Provision a Linux server(Ubuntu).
Install Docker:
sudo apt update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker

Install Jenkins:
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

Step 3: Configure Jenkins
Access Jenkins via http://<server-ip>:8080 and unlock it.
Install required plugins: Git, Docker, Pipeline.
Create a Pipeline Job to automate deployment.

Step 4: Write Dockerfile
In your website repo, create a Dockerfile:

# Use a lightweight web server image
FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80
This builds a Docker image serving your website via Nginx.

Step 5: Create Bash Deployment Script
Create deploy.sh to automate container deployment:
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

Step 6: Configure Jenkins Pipeline

Connect Jenkins to your GitHub repo and define a declarative pipeline:

pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/username/static-website.git'
            }
        }
        stage('Build & Deploy') {
            steps {
                sh 'bash deploy.sh'
            }
        }
    }
}


This pipeline automatically pulls code, builds the Docker image, and deploys the website.

Step 7: Test Deployment
Open browser and visit http://<server-ip> to verify the website is running.
Commit changes to GitHub and observe Jenkins automatically deploy updates.

Step 8: Add Monitoring & Automation
Use AWS CloudWatch to monitor EC2 instance metrics (CPU, memory, disk, network).
Create alarms for threshold breaches and integrate with SNS for notifications.
Enable CloudWatch Logs to capture Docker container logs.

