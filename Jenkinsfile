pipeline {
    agent {
        dockerfile true
    }

    environment {
        DOCKER_HOME = tool name: 'docker-1', type: 'dockerTool'
        DOCKER_CMD = "/usr/local/bin/docker"
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
                sh "${DOCKER_CMD} build -t jackiecwtsoi/simple-java-image ."
            }
        }
    }
}
