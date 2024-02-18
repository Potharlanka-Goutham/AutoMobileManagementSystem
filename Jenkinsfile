pipeline {
    agent any
    tools {
        maven "M3"
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Potharlanka-Goutham/AutoMobileManagementSystem.git']]])
                bat 'mvn clean install'
            }
        }
        stage('Build docker image') {
            steps {
                script {
                    bat 'docker build -t potharlankagoutham08/devops-integration .'
                }
            }
        }
        stage('Push image to Hub') {
            steps {
                script {
                    bat 'docker login -u potharlankagoutham08 -p Gouthamrebel@2004 '
                    bat 'docker push potharlankagoutham08/devops-integration'
                }
            }
        }
        stage('Deploy to k8s') {
            steps {
                script {
                    kubernetesDeploy(configs: 'deploymentservice.yaml', kubeconfigId: 'k8sconfigpwd')
                }
            }
        }
    }
}
