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

          docker.build('maven-build', '.').inside {
            maven cmd: '-f market-test verify'
          }
          recordIssues tools: [eclipse()], unstableTotalAll: 1
          recordIssues tools: [mavenConsole()], unstableTotalAll: 1
          junit '**/target/surefire-reports/**/*.xml'
        }
      }
    }

    stage('deploy') {
      when {
        branch 'master'
      }
      agent {
        docker {
          image 'axonivy/build-container:ssh-client-1.0'
        }
      }
      environment {
        DIST_FILE = "market.tar"
      }
      steps {
        sh "tar -cf ${env.DIST_FILE} market"
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
          }
        }
      }
    }
  }
}
