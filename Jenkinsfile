node {
  stage('show info') {
    bat 'java -version'
    bat 'mvn --version'
  }
  stage ('clone code') {
    // 以下會 clone 指定分支到 workspace
    git branch: 'dev', changelog: false, poll: false, url: 'https://github.com/tszyi/jenkins-example'
  }
  stage('build'){
    echo "build starting"
    bat 'mvn -B -DskipTests clean package'
  }
  stage('test'){
    echo 'test starting'
    bat 'mvn test'
  }
  stage('deploy'){
      echo 'deploy starting'
      sh 'echo hello world'
      // sh 'ssh root@192.168.56.108 \'bash -s\' < ./script/pre-deploy.sh'
      // sh './script/deploy.sh'
  }
}