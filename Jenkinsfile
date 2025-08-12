pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/<your-username>/<repo-name>.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh './deploy.sh'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
            // Add Slack/email notification steps here if configured
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
