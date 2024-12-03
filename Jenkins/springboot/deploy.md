
# Assignment 4
Create a Declarative CI  pipeline for java based project that contains various stages like
```
-> Code checkout
```
```
pipeline {
    agent any 
    // tools {
    //   jdk 'jdk-11'
    //   git 'Default'
    // }

    environment {
        // Telegram configuration
        telegramBotId = credentials('telegram-botid')
        telegramChatId = credentials('telegram-chatid')
    }
    stages {
        stage('Stage 1') {
            steps {
                echo 'Hello world!' 
            }
        }
        stage('Git Clone') {
            steps {
                git 'https://github.com/opstree/spring3hibernate.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Parallel') {
          parallel {
            stage('Code Stability') {
              steps {
                sh 'mvn pmd:pmd'
              }
            }
            stage('Quality Analysis') {
              steps {
                  script {
                    try {
                        sh 'mvn findbugs:findbugs'
                    }
                    catch (Exception e) {
                        echo "Exception findbugs analysis failed : ${e.message}"
                    }
                  }
              }
            }
            stage('Code Coverage') {
              steps {
                  sh 'mvn cobertura:cobertura'
              }
            }
          }
        }
        stage('Generate Report') {
            steps {
                recordIssues sourceCodeRetention: 'LAST_BUILD', tools: [pmdParser(pattern: '**/pmd.xml'), checkStyle(pattern: '**/checkstyle-result.xml'), findBugs(pattern: '**/findbugsXml.xml', useRankAsPriority: true)]
                recordCoverage(tools: [[parser: 'COBERTURA', pattern: 'target/site/cobertura/coverage.xml']])
            }
        }
        stage('Unit Test') {
            steps {
                sh 'mvn surefire-report:report'
                // junit '**/target/surefire-reports/TEST-*.xml'
            }
        }
        stage('Deployment') {
            steps {
                timeout(10) {
                    input id: 'userInput', message: 'Please provide input', ok: 'Proceed'
                }
                
                sh 'echo deployment'
            }
        }
    }
    post {
        always {
           echo 'always'
            // junit '**/reports/junit/*.xml'
        }
      aborted {
        sh "curl -X POST -H 'Content-Type: application/json' -d '{\"chat_id\": \"${telegramChatId}\", \"text\": \"${JOB_NAME}: #${BUILD_NUMBER}\n❌Deploy aborted!  n\"${JOB_URL}\"\", \"disable_notification\": false}' \"https://api.telegram.org/bot${telegramBotId}/sendMessage\""
        slackSend channel: 'jenkins-notifications', message: '\\"${JOB_NAME}: #${BUILD_NUMBER}\\n❌Deploy failure!  \\n\\"${JOB_URL}\\"\\", \\"disable_notification\\": false}\' \\"https://api.telegram.org/bot${telegramBotId}/sendMessage\\"'
        slackSend channel: 'jenkins', message: '\\"${JOB_NAME}: #${BUILD_NUMBER}\\n❌Deploy failure!  \\n\\"${JOB_URL}\\"\\", \\"disable_notification\\": false}\' \\"https://api.telegram.org/bot${telegramBotId}/sendMessage\\"'
        mail bcc: '', body: 'Job Passed', cc: '', from: '', replyTo: '', subject: 'Jenkins Notification', to: 'himanshumudgal8485@gmail.com'
          
      }
      success {
        sh "curl -X POST -H 'Content-Type: application/json' -d '{\"chat_id\": \"${telegramChatId}\", \"text\": \"${JOB_NAME}: #${BUILD_NUMBER}\n✅ Deploy succeeded! \", \"disable_notification\": false}' \"https://api.telegram.org/bot${telegramBotId}/sendMessage\""
        slackSend channel: 'jenkins-notifications', message: '\\"${JOB_NAME}: #${BUILD_NUMBER}\\n❌Deploy failure!  \\n\\"${JOB_URL}\\"\\", \\"disable_notification\\": false}\' \\"https://api.telegram.org/bot${telegramBotId}/sendMessage\\"'
        slackSend channel: 'jenkins', message: '\\"${JOB_NAME}: #${BUILD_NUMBER}\\n❌Deploy failure!  \\n\\"${JOB_URL}\\"\\", \\"disable_notification\\": false}\' \\"https://api.telegram.org/bot${telegramBotId}/sendMessage\\"'
        mail bcc: '', body: 'Job Passed', cc: '', from: '', replyTo: '', subject: 'Jenkins Notification', to: 'himanshumudgal8485@gmail.com'
          
      }
      failure {
        sh "curl -X POST -H 'Content-Type: application/json' -d '{\"chat_id\": \"${telegramChatId}\", \"text\": \"${JOB_NAME}: #${BUILD_NUMBER}\n❌Deploy failure!  \n\"${JOB_URL}\"\", \"disable_notification\": false}' \"https://api.telegram.org/bot${telegramBotId}/sendMessage\""
        slackSend channel: 'jenkins-notifications', message: '\\"${JOB_NAME}: #${BUILD_NUMBER}\\n❌Deploy failure!  \\n\\"${JOB_URL}\\"\\", \\"disable_notification\\": false}\' \\"https://api.telegram.org/bot${telegramBotId}/sendMessage\\"'
        slackSend channel: 'jenkins', message: '\\"${JOB_NAME}: #${BUILD_NUMBER}\\n❌Deploy failure!  \\n\\"${JOB_URL}\\"\\", \\"disable_notification\\": false}\' \\"https://api.telegram.org/bot${telegramBotId}/sendMessage\\"'
      }
    }

}
```
Run the below stages in parallel
```
  - Code stability.
  - Code quality analysis.
  - Code coverage analysis.
```
-> Generate a report for code quality & analysis.

-> Publish artifacts.

-> Send Slack and Email notifications.

-> The user should have the option to skip various scans in the build execution. Before publishing there should be an approval stage to be set in place to approve or deny the publication and if approved the step should execute and the user should be notified post successful/failed

# Execution:

## Pipeline Script-

![1](https://github.com/user-attachments/assets/a757498f-9d92-4e44-95c3-4ebb544800b0)


![2](https://github.com/user-attachments/assets/18d3db4e-2404-4b4b-a120-6f990a6d795b)

![3](https://github.com/user-attachments/assets/300e48e2-3b35-498a-b801-a3109b947f1f)

![4](https://github.com/user-attachments/assets/3945d1bb-4f92-41d0-8ac2-1f0da2dea3b1)

## After Execution of the pipeline.

![5](https://github.com/user-attachments/assets/75461e9d-5ad4-427d-9c22-67043575b6c3)

## Stages are running in parallel.

![6](https://github.com/user-attachments/assets/466288bd-e13b-42dc-a6e8-62fa39018192)

## Successfully executed the pipeline. 

![7](https://github.com/user-attachments/assets/2c6af87f-428a-4d45-b5a2-cd2b4023a27a)

### The code coverage analysis report (cobertura) has been generated, and a report find bugs has also been produced.

![8](https://github.com/user-attachments/assets/b8bf8272-ff49-4e1d-a14f-c392c3b3f6ff)

![9](https://github.com/user-attachments/assets/6b15484b-a22c-48ed-8c41-30cc4c7d1300)

## Slack Notification.

![10](https://github.com/user-attachments/assets/59d2a812-3a5d-4bf1-b367-c2ea681814d4)

 ## Tomcat before deployment of the artifacts.

![11](https://github.com/user-attachments/assets/98366095-8e17-4570-994a-db7290fe5307)

## Tomcat after artifact deployment (on the left side we see the spring3hybernate app).

![12](https://github.com/user-attachments/assets/30af04e2-7c61-45c5-af41-95e09c5ff326)

![13](https://github.com/user-attachments/assets/ade76a95-0034-4163-8a5e-0b7950368217)
