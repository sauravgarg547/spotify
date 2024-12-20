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
                    // Ensure the k8s directory exists before proceeding
                    sh '''
                        if [ ! -d "k8s" ]; then
                            echo "Directory 'k8s' not found!"
                            exit 1
                        fi
                    '''
                    
                    // Navigate to the k8s directory
                    dir('k8s') {
                        // Make deploy.sh executable
                        sh 'chmod +x ./deploy.sh'
                        
                        // Run the deploy script
                        sh './deploy.sh'
                    }
                }
            }
        }

        stage("Docker Deploy") {
            steps {
                script {
                    // Check Kubernetes resources in the specified namespace
                    sh '''
                        kubectl get all -n spotify || {
                            echo "Error: Could not retrieve Kubernetes resources."
                            exit 1
                        }
                    '''
                }
            }
        }

        stage("Port Forwarding") {
            steps {
                script {
                    // Forward frontend and backend service ports
                    sh '''
                        kubectl port-forward service/frontend-service -n spotify 3000:3000 --address=0.0.0.0 &
                        kubectl port-forward service/backend-service -n spotify 5000:5000 --address=0.0.0.0 &
                    '''
                }
            }
        }
    }
}
