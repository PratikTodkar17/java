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
	stage('Docker Hub Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'Pratik17',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }

        stage('Verify Deployment') {
            steps {
                sh 'kubectl get deployments'
                sh 'kubectl get pods'
            }
        }
    }
} 
