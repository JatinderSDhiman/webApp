pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven3.9"
    }
    environment{
        DOCKERHUB_PWD=credentials('CredentialID_DockerHubPWD')
    }

    stages {
        stage('Check out') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/JatinderSDhiman/webApp.git'
            }

        }
        stage("Build maven project") {
               steps {
                    sh 'mvn clean package'
               }
        }
          
        stage("Unit test") {
               steps {
                    sh "mvn test"
               }
        }
                
        stage("Docker build") {
               steps {
                        script {
                                 sh "docker build -t jatinderdhiman/myfirstimage:1 ."
                               }
                       }
        }
         stage('login'){
            steps{
                script{
                    sh 'docker login -u jatinderdhiman -p ${DOCKERHUB_PWD} '
                    sh 'echo SUCESS'
                }
            }
        }
        
        stage('Push Image'){
            steps{
                script{
                    sh 'docker push jatinderdhiman/myfirstimage:1'
                }
            }
        }

    }
}
