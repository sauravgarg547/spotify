@Library('devops-library') _

pipeline {
    agent { label 'dev-server' }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerHubCreds')
        GIT_REPO_URL = 'https://github.com/sauravgarg547/spotify.git'
        GIT_BRANCH = 'main'
    }

    stages {
        stage('Code Clone') {
            steps {
                script {
                    echo "Cloning repository from ${GIT_REPO_URL}..."
                }
                gitClone(GIT_REPO_URL, GIT_BRANCH)
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    echo "Building Docker images..."
                }
                dockerCompose()
            }
        }

        stage('Push Backend Image') {
            steps {
                script {
                    echo "Pushing backend image..."
                }
                pushDockerImage('spotifyci-cd_backend:latest ', 'spotify-backend:latest')
            }
        }

        stage('Push Frontend Image') {
            steps {
                script {
                    echo "Pushing frontend image..."
                }
                pushDockerImage('spotifyci-cd_frontend:latest', 'spotify-frontend:latest')
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully."
        }
        failure {
            echo "❌ Pipeline failed. Check the logs for errors."
        }
    }
}
