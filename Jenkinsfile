node {   
    stage('Clone repository') {
        git url: 'https://github.com/henamorado29102/hello-world-node.git', branch: 'main'
    }
    
    stage('Build image') {
        dockerImage = docker.build("henamorado/hello-world-node:latest")
    }
    
    stage('Push image') {
       withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
        dockerImage.push()
       }
    }    
}
