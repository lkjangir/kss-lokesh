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
        parallel(
          "test-package": {
            sh 'mvn package'
            
          },
          "list": {
            sh 'ls target/'
            
          }
        )
      }
    }
    stage('archive') {
      steps {
        parallel(
          "archive": {
            archiveArtifacts(allowEmptyArchive: true, artifacts: 'target/**/*.jar')
            
          },
          "list": {
            sh '''ls


'''
            
          },
          "list1": {
            sh 'ls target/'
            
          }
        )
      }
    }
    stage('build-image') {
      agent any
      steps {
        app = docker.build("getintodevops/hellonode")
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
