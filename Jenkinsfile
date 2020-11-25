node {
  stage ('scripted pipeline') {
    echo 'hello scripted pipeline'
    // 以下會 clone 指定分支到 workspace
    git branch: 'dev', changelog: false, poll: false, url: 'https://github.com/tszyi/jenkins-example'
    bat 'dir'
  }
  stage('build'){
    steps{
      echo "build starting"
      bat 'mvn -B -DskipTests clean package'
    }
  }
  stage('test'){
    steps{
      echo 'test starting'
      bat 'mvn test'
    }
  }
  stage('deploy'){
      steps{
          echo 'deploy starting'

      }
  }
}