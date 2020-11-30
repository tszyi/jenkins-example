node {
  // TODO 由SCM的webhook 觸發build
  stage ('clone code') {
    // 以下會 clone 指定分支到 workspace
    git branch: 'dev', changelog: false, poll: false, url: 'https://github.com/tszyi/jenkins-example'
  }
  withEnv(['M2=/usr/local/maven/bin/mvn']) {
    // some block
    stage('build'){
      echo "build starting"
      echo sh(script: 'env|sort', returnStdout: true)
      sh "$M2 -B -DskipTests clean package"
    }
    stage('test'){
      echo 'test starting'
      sh "$M2 test"
    }
  }
  stage('deploy'){
    echo 'deploy starting'
    withCredentials([sshUserPrivateKey(credentialsId: 'ssh-deploy-tomcat', keyFileVariable: 'KEYFILE', passphraseVariable: 'PASS', usernameVariable: 'USER')]) {
      // sshagent(['ssh-56.108-credential']) {
      //   sh """
      //     ssh -o StrictHostKeyChecking=no root@192.168.56.108 \'bash -s \' < ./script/pre-deploy.sh
      //     ./script/deploy.sh
      //     """
      // }
      // withCredentials([sshUserPrivateKey(credentialsId: 'ssh-56.108-credential', keyFileVariable: 'KEY', passphraseVariable: 'PASS', usernameVariable: 'USER')]) {
      //     // sh  'ssh -o StrictHostKeyChecking=no -i $KEY -l $USER 192.168.56.108'
      //     // sh  'echo hello world' 
      // }

      // OK!
      // withCredentials([sshUserPrivateKey(credentialsId: 'ssh-deploy-tomcat', keyFileVariable: 'KEYFILE', passphraseVariable: '', usernameVariable: 'USER')]) {
      //   sh  'ssh -i $KEYFILE -l $USER 192.168.56.108'
      //   sh  'echo hello world' 
      // }
      // OK!
      // withCredentials([sshUserPrivateKey(credentialsId: 'ssh-deploy-tomcat', keyFileVariable: 'KEYFILE', passphraseVariable: '', usernameVariable: 'USER')]) {
      //   def remote = [:]
      //   remote.name = 'root'
      //   remote.host = '192.168.56.108'
      //   remote.user = USER
      //   remote.identityFile  = KEYFILE
      //   remote.allowAnyHosts = true
      //   sshPut remote: remote, from: './target/my-app.war', into: '/opt/apache-tomcat-8.5.60/webapps'
      // }
      def remote = [:]
      remote.name = 'root'
      remote.host = '192.168.56.108'
      remote.user = USER
      remote.identityFile  = KEYFILE
      remote.allowAnyHosts = true
      sshScript remote: remote, script: './script/pre-deploy.sh'
      sh 'chmod 744 ./target/my-app.war'
      sshPut remote: remote, from: './target/my-app.war', into: '/opt/apache-tomcat-8.5.60/webapps'
      // sh 'chmod 744 ./script/pre-deploy.sh'
      // sh 'ssh -i $KEYFILE $USER@192.168.56.108 \'./script/pre-deploy.sh && exit\''
      
      
      
      // withCredentials([sshUserPrivateKey(credentialsId: 'ssh-56.108-credential', keyFileVariable: 'KEY', passphraseVariable: 'PASS', usernameVariable: 'USER')]) {
      //   def remote = [:]
      //   remote.name = 'root'
      //   remote.host = '192.168.56.108'
      //   remote.user = USER
      //   remote.identityFile  = KEY
      //   remote.allowAnyHosts = true
      //   sshPut remote: remote, from: './target/my-app.war', into: '/opt/apache-tomcat-8.5.60/webapps'
      // }
      // sh 'ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.56.108'
      // sh 'ssh root@192.168.56.108 \'bash -s\' < ./script/pre-deploy.sh'
      // sh './script/deploy.sh'

      // ssh -o StrictHostKeyChecking=no -l root 10.6.xxx.xxx <<-EOF
      //     Do........................................................			
      //     exit
    }
    sh 'chmod 744 ./script/deploy.sh'
    sh './script/deploy.sh' 
    sh 'echo all done'
  }
}