pipeline {
    agent any

    environment {
        DOCKER_PATH = "/usr/local/bin/docker"
        DOCKER_HUB_CREDENTIALS=credentials('docker-hub')
        DOCKER_PWD='Rchk1457*'
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
            steps {
                echo 'Logging into Docker Hub account...'
                sh '$DOCKER_PATH login -u ${DOCKER_HUB_CREDENTIALS} -p $DOCKER_PWD docker.io'
                echo 'Pushing image to Docker Hub...'
                sh '$DOCKER_PATH push jackiecwtsoi/simple-java-image:latest'
            }
        }
    }
    post {
        always {
            sh '$DOCKER_PATH logout'
        }
    }
}
