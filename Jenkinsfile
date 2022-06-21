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
                sh './gradlew build'
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
            steps {
                echo 'Logging into Docker Hub account...'
                sh "echo ${DOCKER_HUB_CREDENTIALS} | docker login -u ${DOCKER_HUB_CREDENTIALS} --password-stdin"
                echo 'Pushing image to Docker Hub...'
                sh 'docker push jackiecwtsoi/simple-java-image:latest'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
