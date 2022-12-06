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
