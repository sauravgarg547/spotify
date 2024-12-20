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
                    dir('k8s') {
                        sh 'chmod +x ./deploy.sh'
                        sh './deploy.sh'
                    }
                }
            }
        }

        stage("Docker Deploy") {
            steps {
                sh 'kubectl get all -n spotify'
            }
        }

        stage("Port Forwarding") {
            steps {
                script {
                    // Free up ports 3000 and 5000 if they are in use
                    sh '''
                        fuser -k 3000/tcp || true
                        fuser -k 5000/tcp || true
                        
                        kubectl port-forward service/frontend-service -n spotify 3000:3000 --address=0.0.0.0 &
                        kubectl port-forward service/backend-service -n spotify 5000:5000 --address=0.0.0.0 &
                    '''
                }
            }
        }
    }
}
