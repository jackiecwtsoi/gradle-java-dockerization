pipeline {
    agent any

    environment {
        DOCKER_PATH = "/usr/local/bin/docker"
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
                sh "${DOCKER_PATH} build -t simple-java-image ."
                echo 'Listing all created images: '
                sh "${DOCKER_PATH} images"
            }
        }
        stage('Publish Docker Image') {
            echo 'Pushing image to Docker Hub...'
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
                app.push("${env.BUILD_NUMBER}")
                app.push('latest')
            }
        }
    }
}
