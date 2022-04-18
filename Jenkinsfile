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
                stash includes: 'build/intsum-*-Linux.deb', name: 'linux_build' 
            }
        }
        stage('Test') {
            agent {
                docker { image 'ubuntu:20.04' }
            }
            steps {
                unstash 'linux_build'
                sh 'ls -la'
            }
        }
    }
}
