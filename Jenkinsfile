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
                sh 'docker-compose down'
                sh 'docker-compose build'
                sh 'docker-compose up -d'   
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

