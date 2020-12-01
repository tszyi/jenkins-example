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
      sh 'chmod 744 ./target/my-app.war'
      // sshPut remote: remote, from: './target/my-app.war', into: '/opt/tomcat/webapps'
      sh 'scp -vvv -i $KEYFILE ./target/my-app.war $USER@192.168.56.111:/opt/tomcat/webapps'
    }
    sh 'chmod 744 ./script/deploy.sh'
    sh './script/deploy.sh' 
  }
}