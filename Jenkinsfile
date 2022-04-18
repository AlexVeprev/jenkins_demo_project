pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker { image 'ubuntu:20.04' }
            }
            steps {
                sh 'apt update && apt install cmake g++'
                sh 'cmake -B build -S .'
            }
        }
    }
}
