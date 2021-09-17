pipeline {
  //Donde se va a ejecutar el Pipeline
  agent any

  //Opciones específicas de Pipeline dentro del Pipeline
  options {
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
            sh "xcodebuild test -scheme Domain -destination 'platform=iOS Simulator,name=iPhone 11 Pro,OS=latest'"
        }
    }

    stage('Static Code Analysis') {
      steps{
        echo '------------>Análisis estático de codigo<------------'
        sh '/opt/sonarswift/run-sonar-swift.sh'
        sh 'cp sonar-reports/coverage-swift.xml ./'
        withSonarQubeEnv('Sonar') {
            sh "sonar-scanner -Dproject.settings=sonar-project.properties"
        }
      }
    }
  }
}