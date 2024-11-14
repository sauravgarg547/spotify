@Library('devops-library') _

pipeline {
    agent { label 'dev-server' }

    environment {
        // Define environment variables if needed, such as Docker registry credentials
    }

    stages {
        stage('Code Clone') {
            steps {
                // Cloning the repository from GitHub
                script {
                    gitClone('https://github.com/sauravgarg547/spotify.git', 'main')
                }
            }
        }

        stage('Build Docker Images') {
            steps {
                // Build Docker images for both backend and frontend
                script {
                    deploy() // Ensure 'deploy' builds both frontend and backend Docker images
                }
            }
        }

        stage('Push Backend Image') {
            steps {
                // Pushing the backend Docker image to the registry
                script {
                    pushDockerImage('spotify-web-app-cicd_backend:latest', 'spotify-backend:latest')
                }
            }
        }

        stage('Push Frontend Image') {
            steps {
                // Pushing the frontend Docker image to the registry
                script {
                    pushDockerImage('spotify-web-app-cicd_frontend:latest', 'spotify-frontend:latest')
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
        always {
            echo 'Cleaning up workspace...'
            cleanWs() // Cleans up workspace after execution
        }
    }
}
