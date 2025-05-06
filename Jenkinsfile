pipeline {  
  agent any

  triggers {
    cron '@midnight'
  }

  options {
    buildDiscarder(logRotator(numToKeepStr: '60', artifactNumToKeepStr: '3'))
    skipStagesAfterUnstable()
  }

  stages {
    stage('validate') { 
      steps {
        script {          
          docker.image('mstruebing/editorconfig-checker:2.0.4').inside {
            sh 'ec -no-color'
          }

          docker.image('maven:3.9.9-eclipse-temurin-21').inside {
            dir ('market-test') {
              maven cmd: 'compile exec:java -Dexec.mainClass="com.axonivy.market.CreateBundle" -Dmaven.plugin.validation=none -Duser.home=/tmp'
              maven cmd: 'verify -P json.schema -Dmaven.plugin.validation=none -Duser.home=/tmp'
            }
          }          
          recordIssues tools: [eclipse()], unstableTotalAll: 1
          recordIssues tools: [mavenConsole()], unstableTotalAll: 1
          junit '**/target/surefire-reports/**/*.xml'
          archiveArtifacts '**/target/schema/market/*/*.json'
        }
      }
    }
    stage('deploy') {
      when {
        branch 'master'
      }
      agent {
        docker {
          image 'axonivy/build-container:ssh-client-1'
          reuseNode true
        }
      }
      steps {
        sshagent(['zugprojenkins-ssh']) {
          script {
            def host = 'axonivya@217.26.51.247'
            def homeDir = '/home/axonivya'
            def dir = "$homeDir/www/json-schema.ivyteam.ch"
            echo "Upload market.meta.json.schemas to $host:$dir"
            sh "rsync --mkpath -r `echo */target/schema/market` $host:$dir/"
          }
        }
      }
    }
  }
}
