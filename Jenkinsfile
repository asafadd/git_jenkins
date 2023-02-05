pipeline {
    agent {
        docker {
            image 'python:3.8-alpine'
            args '-v $HOME/.docker:/root/.docker -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build and Run Docker Container') {
            steps {
                sh 'docker build -t my-python-app .'
                sh 'docker-compose up --build -d'
            }
        }
    }
}
