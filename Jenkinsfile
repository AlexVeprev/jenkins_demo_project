pipeline {
    agent {
        docker { image 'ubuntu:20.04' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'cat /etc/*release'
            }
        }
    }
}
