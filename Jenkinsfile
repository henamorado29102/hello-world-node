pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-he')
        SERVERAPP_CREDENTIALS = credentials('app-server-3.99.183.212')
    }
    stages {
        stage('Clone Repository') {
            steps {
                echo 'Clone Repository..'
                git url: 'https://github.com/henamorado29102/hello-world-node.git', branch: 'main'
            }
        }
        stage('Build image') {
            steps {
                script{
                    sh 'docker build -t henamorado/hello-world-node:latest .'
                }
            }
        }
        stage('Login Docker Hub') {
            steps {
                echo 'login docker hub..'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push image to docker Hub') {
            steps {
                echo 'push image..'
                sh 'docker push henamorado/hello-world-node:latest'
            }
        }
        stage('Deploy to produccion') {
            steps {
                sshagent(['app-server-3.99.183.212']) {
                    sh 'ssh -tt -o StrictHostKeyChecking=no ec2-user@10.0.6.81 sudo sh docker_run.sh'
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