pipeline {
agent any
  stages {
  
    stage('Build Image'){
      steps {
      sh '''
         npm install
         sudo docker build -t node-hello .
         '''
      }

      post {
      always {
        junit(testResults: 'target/surefire-reports/*.xml', allowEmptyResults : true)
      }
    }  
    
    }
    stage('Test'){
      steps {
      sh 'npm run test'
      }
    }
    stage('SonarQube'){
      steps{
      sh '''
     ` sonar-scanner \
      -Dsonar.projectKey=test-app \
      -Dsonar.sources=. \
      -Dsonar.host.url=http://3.27.24.166:9000 \
      -Dsonar.login=sqp_f6306f75f2429c9873fd9763c636d2e7a7511266
      
      '''
      }
    }

        stage('Deploy Container'){
      steps {
      sh '''
         sudo docker stop node-hello
         sudo docker rm node-hello
         sudo docker run -itd -p 3000:3000 --name node-hello node-hello
         '''
      }
    }
    
    
    
  }

}
