pipeline {
  //Donde se va a ejecutar el Pipeline
  agent any

  //Opciones específicas de Pipeline dentro del Pipeline
  options {
    	buildDiscarder(logRotator(numToKeepStr: '3'))
 	    disableConcurrentBuilds()
  }

  //Aquí comienzan los “items” del Pipeline
  stages{

    stage('Compile') {
        steps {
            echo "------------>Compile<------------"
            sh 'pod install'
            sh 'xcodebuild -scheme Presentation clean build CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED="NO"'
        }
    }

    stage('Unit Tests') {
        steps{
            echo "------------>Unit Tests<------------"
            sh "xcodebuild test -project Domain/Domain.xcodeproj -scheme DomainTests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 11 Pro,OS=latest'"
        }
    }

    stage('Static Code Analysis') {
      steps{
        echo '------------>Análisis estático de codigo<------------'
        withSonarQubeEnv('Sonar') {
            sh "sonar-scanner -Dproject.settings=sonar-project.properties"
        }
      }
    }
  }

  post {
    always {
      echo 'This will always run'
    }
    success {
      echo 'This will run only if successful'
      junit 'build/test-results/test/*.xml' //RUTA DE TUS ARCHIVOS .XML

    }
    failure {
      echo 'This will run only if failed'
      mail (to: 'andrey.carreno@ceiba.com.co',subject: "Failed Pipeline:${currentBuild.fullDisplayName}",body: "Something is wrong with ${env.BUILD_URL}")

    }
    unstable {
      echo 'This will run only if the run was marked as unstable'
    }
    changed {
      echo 'This will run only if the state of the Pipeline has changed'
      echo 'For example, if the Pipeline was previously failing but is now successful'
    }
  }
}
