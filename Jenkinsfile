pipeline {
    agent { label "prod" }

    stages {
        stage("Code Clone") {
            steps {
                echo "Git clone"
                git url: "https://github.com/sauravgarg547/spotify.git", branch: "main"
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
