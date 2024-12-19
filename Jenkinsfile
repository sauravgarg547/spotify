pipeline {
    agent { label "prod" }
    
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
                    sh 'chmod +x ./deploy.sh'
                    sh './deploy.sh'
                }
            }
        }
        stage("Docker Deploy") {
            steps {
                sh 'kubectl get all -n spotify ' // Display all running containers
            }
        }
    }
}
