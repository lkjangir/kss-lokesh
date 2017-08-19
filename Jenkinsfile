pipeline {
  agent {
    docker {
      image 'maven:3.5-jdk-8'
    }
    
  }
  stages {
    stage('Greetings') {
      steps {
        input(message: 'Start Job', ok: 'yes')
      }
    }
    stage('test') {
      steps {
        sh 'mvn package'
        sh 'mvn test'
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