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
      withCredentials([sshUserPrivateKey(credentialsId: 'test-cred', keyFileVariable: 'KEY_FILE', passphraseVariable: 'PASS', usernameVariable: 'USER')]) {
        // sh  """
        //     ssh root@192.168.56.108 'bash -s ' < ./script/pre-deploy.sh
        //     ./script/deploy.sh
        //     """
        sh  'ssh -o StrictHostKeyChecking=no -i "$KEY_FILE" root@192.168.56.108'
        sh  'echo hello world'   
        
      }
      // sh 'ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.56.108'
      // sh 'ssh root@192.168.56.108 \'bash -s\' < ./script/pre-deploy.sh'
      // sh './script/deploy.sh'

      // ssh -o StrictHostKeyChecking=no -l root 10.6.xxx.xxx <<-EOF
      //     Do........................................................			
      //     exit
  }
}