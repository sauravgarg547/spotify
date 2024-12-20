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

        stage("Port fuser") {
            steps {
                script {
                    
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
                    // Validate services
                    sh '''
                        kubectl get svc frontend-service -n spotify || exit 1
                        kubectl get svc backend-service -n spotify || exit 1
                    '''
                    
                    // Port forward services
                    sh '''
                        nohup kubectl port-forward service/frontend-service -n spotify 3000:3000 --address=0.0.0.0 > frontend.log 2>&1 &
                        nohup kubectl port-forward service/backend-service -n spotify 5000:5000 --address=0.0.0.0 > backend.log 2>&1 &
                    '''
                }
            }
        }
    }
}
