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
                ctest --output-on-failure
                cpack -G DEB
                '''
            }
        }
    }
}
