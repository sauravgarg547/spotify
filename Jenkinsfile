pipeline {
    agent { label "dev-server" }
    environment {
        // DockerHub credentials
        DOCKERHUB_CREDS = "dockerHubCreds" // Replace with your Jenkins credentials ID
    }
    stages {
        stage("Code Clone") {
            steps {
                git url: "https://github.com/sauravgarg547/spotify.git", branch: "main"
            }
        }

        stage("Build and Run Containers") {
            steps {
                script {
                    // Build and run the backend and frontend containers using Docker Compose
                    sh 'docker-compose build'
                    sh 'docker-compose up -d'
                }
            }
        }

        stage("Push Backend to DockerHub") {
            steps {
                script {
                    def backendContainerRunning = sh(
                        script: 'docker ps -q -f name=backend-container', // Replace with your actual backend container name
                        returnStatus: true
                    )
                    if (backendContainerRunning == 0) {
                        withCredentials([usernamePassword(credentialsId: DOCKERHUB_CREDS, usernameVariable: "dockerHubUser", passwordVariable: "dockerHubPass")]) {
                            sh '''
                                docker login -u ${dockerHubUser} -p ${dockerHubPass}
                                docker image tag spotify-web-app-cicd_backend:latest ${dockerHubUser}/spotify-backend:latest
                                docker push ${dockerHubUser}/spotify-backend:latest
                            '''
                        }
                    } else {
                        error("Backend container is not running, skipping DockerHub push for backend.")
                    }
                }
            }
        }

        stage("Push Frontend to DockerHub") {
            steps {
                script {
                    def frontendContainerRunning = sh(
                        script: 'docker ps -q -f name=frontend-container', // Replace with your actual frontend container name
                        returnStatus: true
                    )
                    if (frontendContainerRunning == 0) {
                        withCredentials([usernamePassword(credentialsId: DOCKERHUB_CREDS, usernameVariable: "dockerHubUser", passwordVariable: "dockerHubPass")]) {
                            sh '''
                                docker login -u ${dockerHubUser} -p ${dockerHubPass}
                                docker image tag spotify-web-app-cicd_frontend:latest ${dockerHubUser}/spotify-frontend:latest
                                docker push ${dockerHubUser}/spotify-frontend:latest
                            '''
                        }
                    } else {
                        error("Frontend container is not running, skipping DockerHub push for frontend.")
                    }
                }
            }
        }

        stage("Docker Deploy") {
            steps {
                sh 'docker ps -a' // Display all running containers
            }
        }
    }
}
