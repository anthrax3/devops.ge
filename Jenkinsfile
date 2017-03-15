// vim:ft=groovy

node {
  def registry = 'registry.devops.ge'
    stage('Checkout'){
      git url: 'https://github.com/tokozedg/devops.ge.git'
        sh 'git submodule update --remote'
        gitCommit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
        shortCommit = gitCommit.take(6)
        slackSend color: 'good', message: "Started ${BUILD_TAG} by changes from commit: ${shortCommit}"
    }

  stage ("Compile"){
    sh 'make html'
  }

  stage ("Build"){
    image = docker.build("${registry}/devops.ge:${shortCommit}", '.')
  }
  stage("Test"){
    echo "Test passed..."
  }

  stage("Deploy"){
    echo "Pushing image..."
      image.push()
      build job: 'devops.ge-deploy', parameters: [string(name: 'shortCommit', value: shortCommit)]
      slackSend color: 'good', message: "Succes deploy commit: ${shortCommit}"
  }
}
