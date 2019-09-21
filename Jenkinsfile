pipeline {
  agent any
  stages {
    stage('step01') {
      parallel {
        stage('step01') {
          steps {
            echo 'date'
          }
        }
        stage('Step02') {
          steps {
            sleep 3
          }
        }
      }
    }
    stage('step03') {
      steps {
        sh 'echo \'date\''
      }
    }
  }
}