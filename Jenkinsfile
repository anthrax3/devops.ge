// vim: ft=groovy

node {

    def registry = 'registry.devops.ge'
    def image
    def short_commit

    stage ("Checkout"){
      slackSend color: 'good', message: "Started ${BUILD_TAG} by changes from commit: ${short_commit}"
      git url = 'https://github.com/tokozedg/devops.ge/'
      git_commit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
      short_commit = git_commit.take(6)

    }

    stage ("Compile"){
      sh 'make html'
    }

    stage ("Build"){
      image = docker.build("${registry}/devops.ge:${short_commit}", '.')
    }

    stage("Test"){
      echo "Test passed..."
    }

    stage("Deploy"){
      echo "Pushing image..."
      image.push(short_commit)
      image.tag('latest')
      image.push()
    }
}

