pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/username/automated-static-website-deployment.git'
            }
        }
        stage('Build & Deploy') {
            steps {
                sh 'bash deploy.sh'
            }
        }
    }
}
