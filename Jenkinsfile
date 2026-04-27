pipeline {
    agent any

    environment {
        IMAGE_NAME = "pratikt8/hello-java-app:v1"
    }

    stages {
        stage('Compile') {
            steps {
                sh 'javac helooo.java'
            }
        }

        stage('Run Java') {
            steps {
                sh 'java helooo'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

	stage('Run Docker Container') {
            steps {
                sh 'docker run --rm $IMAGE_NAME'
            }
        }

    }
} 
