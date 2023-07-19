pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                git url: 'https://github.com/henamorado29102/hello-world-node.git', branch: 'main'
            }
        }
        stage('Test') {
            steps {
                dockerImage = docker.build("henamorado/hello-world-node:latest")
            }
        }
        stage('Deploy') {
            steps {
                withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
                    dockerImage.push()
                }
            }
        }
    }
}
