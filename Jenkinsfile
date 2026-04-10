pipeline {
    agent any
 
    environment {
        APP_VERSION = '1.0.0'
    }

    stages {

        stage{('Discord notification')
           steps{
		echo "Sending Notification...."
		post {
    always {
        withCredentials([string(credentialsId: 'discord-webhook', variable: 'WEBHOOK_URL')]) {
            sh """
            curl -X POST -H "Content-Type: application/json" \
            -d '{"content": "📦 Job: ${JOB_NAME} | Build: #${BUILD_NUMBER} | Status: ${currentBuild.currentResult}"}' \
            $WEBHOOK_URL
            """
        }
    }
}
}

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
