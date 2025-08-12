# Automated Deployment of a Static Website using Jenkins and Docker

## Project Overview
This project automates the deployment of a simple static website using Jenkins pipeline and Docker containers. The deployment runs on an AWS EC2 Linux instance, where Jenkins pulls the latest code from GitHub, builds a Docker image, and deploys the website inside a Docker container served by Nginx. Post-deployment notifications are sent via Slack or email.

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
1. Created a simple static website using HTML and CSS.
2. Stored the website code in a public GitHub repository.
3. Installed Jenkins on an EC2 instance and configured a freestyle project.
4. Connected GitHub repo to Jenkins using webhooks for automatic triggering.
5. Pipeline workflow:
   - Jenkins pulls code from GitHub on every push.
   - Runs a Bash script to build a Docker image from a Dockerfile.
   - Tags and runs the Docker image as a container on the EC2 server.
   - Nginx serves the website inside the Docker container.
6. Configured post-build actions to send Slack/email notifications upon successful deployment.

## How to Use
- Clone this repository.
- Configure Jenkins on a Linux server (preferably EC2).
- Set up GitHub webhook for the Jenkins project.
- Create Dockerfile and Bash scripts as per the pipeline.
- Run the Jenkins job to automatically build and deploy the website.

## Repository Structure
