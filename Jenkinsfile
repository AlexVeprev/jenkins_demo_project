pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                dockerfile true
            }
            steps {
                sh '''
                cmake -B build -S .
                cd build
                make VERBOSE=1
                cpack
                '''
            }
        }
    }
}
