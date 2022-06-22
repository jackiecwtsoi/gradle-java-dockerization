pipeline {
    agent any

    environment {
        DOCKER_PATH = "/usr/local/bin/docker"
        DOCKER_HUB_CREDENTIALS=credentials('docker-hub')
    }

    stages {
        stage('Build Gradle') {
            steps {
                echo 'Building Gradle...'
                build quietPeriod: 3, job: 'gradle-java-docker'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image...'
                sh "${DOCKER_PATH} build -t jackiecwtsoi/simple-java-image /Users/jackietsoi/.jenkins/workspace/simple-pipeline/."
                echo 'Listing all created images: '
                sh "${DOCKER_PATH} images"
            }
        }
        stage('Log In to Docker Hub') {
            steps {
                echo 'Logging in to Docker Hub...'
                sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | $DOCKER_PATH login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Publish Docker Image') {
            steps {
                echo 'Publishing Docker Image onto Docker Hub...'
                sh '$DOCKER_PATH push jackiecwtsoi/simple-java-image:latest'
            }
        }
        stage('Remove Unused Docker Image') {
            steps {
                echo 'Removing unused Docker Image...'
                sh '$DOCKER_PATH rmi jackiecwtsoi/simple-java-image'
                sh '$DOCKER_PATH images'
            }
        }
    }
    post {
        always {
            sh '$DOCKER_PATH logout'
        }
    }
}
