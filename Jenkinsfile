pipeline {
    agent any

    environment {
        DOCKER_PATH = "/usr/local/bin/docker"
    }

    stages {
        stage('Gradle Build') {
            steps {
                echo 'Gradle Build in progress...'
                build quietPeriod: 3, job: 'gradle-java-docker'
            }
        }
        stage('Docker Image Build') {
            steps {
                echo 'Docker Image Build in progress...'
                sh "${DOCKER_PATH} images"
                sh "${DOCKER_PATH} build -t simple-java-image ."
            }
        }
    }
}
