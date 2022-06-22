pipeline {
    agent any

    environment {
        DOCKER_PATH = "/usr/local/bin/docker"
        DOCKER_HUB_CREDENTIALS=credentials('docker-hub')
        DOCKER_PWD = "Rchk1457*"
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
//                 script {
//                     dockerImage = "${DOCKER_PATH}".build imageName
//                 }
                echo 'Listing all created images: '
                sh "${DOCKER_PATH} images"
            }
        }
        stage('Publish Docker Image') {
            steps {
                echo 'Publishing Docker Image onto Docker Hub...'

            }
        }
        stage('Remove Unused Docker Image') {
            steps {
                echo 'Removing unused Docker Image...'
                sh 'docker rmi simple-java-image'
            }
        }
    }
    post {
        always {
            sh '$DOCKER_PATH logout'
        }
    }
}
