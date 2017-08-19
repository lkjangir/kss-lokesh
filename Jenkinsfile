pipeline {
  agent any
  stages {
    stage('Greetings') {
      steps {
        input(message: 'Start Job', ok: 'yes')
      }
    }
    stage('Build') {
      steps {
        sh 'mvn package'
      }
    }
  }
  post {
    always {
      archive 'target/**/*.jar'
      junit 'target/surefire-reports/*.xml'
      
    }
    
  }
}