node {
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
  }
}