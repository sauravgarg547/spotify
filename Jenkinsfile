pipeline{
    agent { label "prod" }

    stages {
        stage("code clone"){
            step {
                echo "Git clone"
                git url: "https://github.com/sauravgarg547/spotify.git", branch: "main"

                
            }
        }
    }
    
    stages {
        stage("Port kill"){
            step {
                script {
                echo "Port kill"
                sh 'sudo kill -9 $(sudo lsof -t -i:3000)'
                sh 'sudo kill -9 $(sudo lsof -t -i:5000)'
                }
                

                
            }
        }
    }

    stages {
        stage("build"){
            step {
                script {
                echo "code build"
                dir('k8s') {
                sh 'chmod +x ./deploy.sh'
                sh './deploy.sh'
                }
                

                
            }
        }
    }

    stages {
        stage (finally){
            steps{
                script{
                    echo "Deployment completed"
                }
            }
        }
    }
}
