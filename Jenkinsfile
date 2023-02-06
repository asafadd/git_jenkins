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
        stage('Test for Security Vulnerabilities') {
            steps {
                sh 'docker run --rm -v "$PWD:/app" aquasec/trivy --no-progress --exit-code 0 my-python-app'
            }
        }
        stage('Test for Maintainability') {
            steps {
                sh 'docker run --rm -v "$PWD:/app" pyup/flake8:3.7.9 flake8 --exclude=venv'
            }
        }
        stage('Test for Memory') {
            steps {
                sh 'docker run --rm -v "$PWD:/app" trufflesuite/memory-profiler:0.3.0 python -m memory_profiler main.py'
            }
        }
    }
}
