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
      withCredentials([sshUserPrivateKey(credentialsId: 'test-cred', keyFileVariable: 'KEY_FILE', passphraseVariable: 'PASS', usernameVariable: 'USER')]) {
        // 用引號的話，輸出將會被屏遮，如此就不會有資安隱憂
        // sh 'echo $KEY_FILE'

        sh "echo $KEY_FILE"
        sh "echo $PASS"
        sh "echo $USER"

        def keyFile = env['KEY_FILE']
        def pass = env['PASS']
        def user = env['USER']
        print "key file is ${keyFile}"
        print "pass is ${pass}"
        print "user is ${user}"
      }
      // sh 'ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.56.108'
      // sh 'ssh root@192.168.56.108 \'bash -s\' < ./script/pre-deploy.sh'
      // sh './script/deploy.sh'
  }
}