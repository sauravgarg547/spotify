pipeline {
    agent any
    stages {
        stage("code clone") {
            steps {
                git url: "https://github.com/sauravgarg547/spotify.git", branch: "main"
            }
        }
        
        stage("build") {
            steps {
                sh 'docker-compose build && docker-compose up -d'
            }
        }
        
        stage("docker deploy") {
            steps {
                // Check if the containers are running
                sh 'docker ps -a'
            }
        }
    }
}
