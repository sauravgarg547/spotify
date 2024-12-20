pipeline {
    agent { label "prod" }

    stages {
        stage("Code Clone") {
            steps {
                echo "Git clone"
                git url: "https://github.com/sauravgarg547/spotify.git", branch: "main"
            }
        }

        stage("Port Kill") {
            steps {
                script {
                    echo "Killing processes on ports 3000 and 5000"
                    sh 'sudo kill -9 $(sudo lsof -t -i:3000 || true)'
                    sh 'sudo kill -9 $(sudo lsof -t -i:5000 || true)'
                }
            }
        }

        stage("Build") {
            steps {
                script {
                    echo "Code build"
                    dir('k8s') {
                        sh 'chmod +x ./deploy.sh'
                        sh './deploy.sh'
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                echo "Deployment completed"
            }
        }
    }
}
