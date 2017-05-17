pipeline {
    agent {
      label 'swarm'
    }

    stages {
        stage('Build') {
            steps {
                echo "My branch is: ${env.BRANCH_NAME}"
                echo "My real branch is: ${'origin/' + sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()}"
                echo 'Building..'
                sh 'bundle install'
            }
        }
        stage('Local Tests') {
            steps {
                echo 'Testing..'
                sh 'bundle exec rake rubocop'
                sh 'bundle exec rake foodcritic'
                sh 'bundle exec rake unit'

            }
            post {
              always {
                checkstyle canComputeNew: false, canRunOnFailed: true, defaultEncoding: '', healthy: '', pattern: 'int-lint-results.xml', unHealthy: ''
                warnings canComputeNew: false, canResolveRelativePaths: false, canRunOnFailed: true, consoleParsers: [[parserName: 'Foodcritic']], defaultEncoding: '', excludePattern: '', healthy: '', includePattern: '', messagesPattern: '', unHealthy: ''
                junit 'junit.xml'
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: true, keepAll: true, reportDir: '', reportFiles: 'index.html', reportName: 'ChefSpec Report', reportTitles: ''])
              }
            }
        }
        stage('Integration Tests') {
           steps {
                echo 'Integration...'
                sh 'kitchen list'
                sh 'kitchen test default'
           }
            post {
              always {
                junit 'serverspec*.xml'
              }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    //post {
     // always {
        // deleteDir() /* clean up our workspace */
    //  }
   // }
}