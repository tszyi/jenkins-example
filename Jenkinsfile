node {
  stage ('scripted pipeline') {
    echo 'hello scripted pipeline'
    git branch: 'dev', changelog: false, poll: false, url: 'https://github.com/tszyi/jenkins-example'
    bat 'dir'
  }
  // stage('build'){
  //   steps{
  //     echo "build starting"
  //     git 
  //     sh 'mvn -B -DskipTests clean package'
  //   }
  // }
  // stage('test'){
  //   steps{
  //     echo 'test starting'
  //     sh 'mvn test'
  //   }
  // }
  // stage('deploy'){
  //     steps{
  //         echo 'deploy starting'

  //     }
  // }
}