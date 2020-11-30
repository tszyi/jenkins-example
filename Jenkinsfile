node {
  // TODO 由SCM的webhook 觸發build
  // stage ('clone code') {
  //   // 以下會 clone 指定分支到 workspace
  //   git branch: 'dev', changelog: false, poll: false, url: 'https://github.com/tszyi/jenkins-example'
  // }
  // stage('build'){
  //   echo "build starting"
  //   bat 'mvn -B -DskipTests clean package'
  // }
  // stage('test'){
  //   echo 'test starting'
  //   bat 'mvn test'
  // }
  stage('deploy'){
      echo 'deploy starting'
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

      withCredentials([sshUserPrivateKey(credentialsId: 'ssh-56.108-credential', keyFileVariable: 'KEY', passphraseVariable: 'PASS', usernameVariable: 'USER')]) {
        def remote = [:]
        remote.name = '192.168.56.108'
        remote.host = '192.168.56.108'
        remote.user = ROOT_USER
        remote.identityFile  = KEY
        remote.allowAnyHosts = true
        sshPut remote: remote, from: './target/my-app.war', into: '/opt/apache-tomcat-8.5.60/webapps'
      }
      // sh 'ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.56.108'
      // sh 'ssh root@192.168.56.108 \'bash -s\' < ./script/pre-deploy.sh'
      // sh './script/deploy.sh'

      // ssh -o StrictHostKeyChecking=no -l root 10.6.xxx.xxx <<-EOF
      //     Do........................................................			
      //     exit
  }
}