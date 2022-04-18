pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker { image 'ubuntu:20.04' }
            }
            steps {
                sh 'su -c "apt update"'
                sh 'cmake -B build -S .'
            }
        }
    }
}
