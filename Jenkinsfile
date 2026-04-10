pipeline {
    agent any
 
    environment {
        APP_VERSION = '1.0.0'
    }

    stages {
        stage{
           steps{
                  "application_id": null,
  "avatar": "96cdaa39e306682e76b4208e29a24af0",
  "channel_id": "1491986896904130743",
  "guild_id": "1315649216370184222",
  "id": "1491988177567744151",
  "name": "Manish Silwal",
  "type": 1,
  "token": "I1IO7GeK-avC-XaPkxGkPAOqa7J2cLkbSQDIFeB-Le9EXPK2LgQ-2x-M_heAjbPcvRE3",
  "url": "https://discord.com/api/webhooks/1491988177567744151/I1IO7GeK-avC-XaPkxGkPAOqa7J2cLkbSQDIFeB-Le9EXPK2LgQ-2x-M_heAjbPcvRE3"
                }
        }
        stage('Checkout') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }
 
        stage('Build') {
            steps {
                echo "Building version ${APP_VERSION}"
                sh 'chmod +x app.sh'
                sh './app.sh'
            }
        }
 
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }
 
        stage('Archive') {
            steps {
                echo 'Archiving artifacts...'
                archiveArtifacts artifacts: 'app.sh', fingerprint: true
            }
        }
    }
 
    post {
        success { echo "Build #${BUILD_NUMBER} succeeded!" }
        failure { echo "Build #${BUILD_NUMBER} failed. Check console." }
        always  { cleanWs() }
       }
}
