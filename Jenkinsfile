pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World! This is a simple Jenkins pipeline job.'
            }
        }
        stage('Build') {
            steps {
                echo 'Building'
                build quietPeriod: 3, job: 'gradle-java-docker'
            }
        }
        stage('Dockerize') {
            steps {
                echo 'Dockerizing'
            }
        }
    }
}
