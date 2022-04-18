pipeline {
    agent none
    stages {
        agent {
            docker { image 'ubuntu:20.04' }
        }
        stage('Build') {
            steps {
                sh 'apt update && apt install cmake g++'
                sh 'cmake -B build -S .'
            }
        }
    }
}
