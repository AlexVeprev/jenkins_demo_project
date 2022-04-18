pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker { image 'ubuntu:20.04' }
            }
            steps {
                sh 'whoami'
                sh 'sudo apt update && sudo apt install cmake g++'
                sh 'cmake -B build -S .'
            }
        }
    }
}
