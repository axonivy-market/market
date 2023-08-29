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

          docker.image('maven:3.9.3-eclipse-temurin-17').inside {
            dir ('market-test') {
              maven cmd: 'compile exec:java -Dexec.mainClass="com.axonivy.market.CreateBundle" -Dmaven.plugin.validation=none'
              maven cmd: 'verify -P json.schema -Dmaven.plugin.validation=none'
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
      environment {
        DIST_FILE = "market.tar"
      }
      steps {
        dir ('market-test/target') {
          sh "tar -cf ../../${env.DIST_FILE} market"
        }
        archiveArtifacts env.DIST_FILE
 
        sshagent(['zugprojenkins-ssh']) {
          script {
            def targetFolder = "/home/axonivya/deployment/market-" + new Date().format("yyyy-MM-dd_HH-mm-ss-SSS");
            def targetFile =  targetFolder + ".tar"
            def host = 'axonivya@217.26.51.247'

            // copy
            sh "scp ${env.DIST_FILE} $host:$targetFile"

            // untar
            sh "ssh $host mkdir $targetFolder"
            sh "ssh $host tar -xf $targetFile -C $targetFolder"
            sh "ssh $host rm -f $targetFile"
  
            // symlink
            sh "ssh $host ln -fns $targetFolder/market /home/axonivya/data/market"

            // schema
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
