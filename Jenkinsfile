node {
  stage ('pull') {
    git branch: 'dev', changelog: false, poll: false, url: 'https://github.com/tszyi/jenkins-example'
  }
  stage('build'){
    sh "mvn -B -DskipTests clean package"
  }
  stage('test'){
    sh "mvn test"
  }
  stage('deploy'){
    withCredentials([sshUserPrivateKey(credentialsId: 'ssh-deploy-tomcat', keyFileVariable: 'KEYFILE', passphraseVariable: 'PASS', usernameVariable: 'USER')]) {
      def remote = [:]
      remote.name = 'root'
      remote.host = '192.168.56.111'
      remote.user = USER
      remote.identityFile  = KEYFILE
      remote.allowAnyHosts = true
      sshScript remote: remote, script: './script/pre-deploy.sh'
      sh 'scp -i $KEYFILE ./target/my-app.war $USER@192.168.56.111:/opt/tomcat/webapps'
      sshScript remote: remote, script: './script/deploy.sh'
    }
  }
}