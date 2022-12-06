pipeline {
agent any
  stages {
  
    stage('Build Image'){
      steps {
      sh '''
         sudo npm install
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
    stage('Sonar-project'){
      steps{
        sh '''
        sonar-scanner \
        -Dsonar.projectKey=sonar-project \
        -Dsonar.sources=. \
        -Dsonar.host.url=http://54.252.215.169:9000 \
        -Dsonar.login=sqp_0e561494357f1e517447217e966b3557ca7c1075
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
