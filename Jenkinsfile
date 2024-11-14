@Library('devops-library') __

pipeline {
    agent { label 'dev-server' }

    stages {
        stage('Code Clone') {
            steps {
                gitClone('https://github.com/sauravgarg547/spotify.git', 'main')
            }
        }

        stage('Build Docker Images') {
            steps {
                // Use shared library to handle docker-compose commands
                dockerCompose()
            }
        }

        stage('Push Backend Image') {
            steps {
                pushDockerImage('spotify-web-app-cicd_backend:latest', 'spotify-backend:latest')
            }
        }

        stage('Push Frontend Image') {
            steps {
                pushDockerImage('spotify-web-app-cicd_frontend:latest', 'spotify-frontend:latest')
            }
        }
    }
}
