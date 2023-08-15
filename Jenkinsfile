pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-he')
    }
    stages {
        stage('Build image') {
            steps {
                script{
                    echo 'Buils container image..'
                    sh 'docker build -t henamorado/hello-world-node:latest .'
                }
            }
        }
        stage('Publish on Docker Hub') {
            steps {
                echo 'login docker hub..'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                echo 'push image to docker hub..'
                sh 'docker push henamorado/hello-world-node:latest'
            }
        }
        stage('Deploy to produccion') {
            steps {
                echo 'execute sh file on app-server..'
                sshagent(['last_test']) {
                    sh 'ssh -tt -o StrictHostKeyChecking=no ec2-user@10.0.1.140 sudo sh docker_run.sh'
                }
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
