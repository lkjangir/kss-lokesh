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
    stage('test-package') {
      steps {
        sh 'mvn package'
      }
    }
    stage('archive') {
      steps {
        archiveArtifacts(allowEmptyArchive: true, artifacts: 'target/**/*.jar')
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