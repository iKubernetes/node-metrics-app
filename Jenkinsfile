pipeline {
    agent {
        kubernetes {
            inheritFrom 'kube-docker'
        }
    }    
    triggers {
        gitlab(triggerOnPush: false,
               triggerOnMergeRequest: true,
               branchFilterType: 'All',
               secretToken: 'afH0tq33ROMS07przzLiclNmfqSaoIeTOolHYf20')
    }   
    environment {
        GitRepo="http://gitlab.magedu.com/root/node-metrics-app.git"
        HarborServer='hub.magedu.com'
        ImageUrl="ikubernetes/node-metrics-app"
        ImageTag="${BUILD_ID}"
        RegistryCredential='harbor-user-credential'
        RegistryUrl="https://${HarborServer}"
    }  
    stages {
        stage('Source') {
            steps {
                git branch: 'main', url: "${GitRepo}"
            }
        }
        stage('SonarQube analysis') {
            steps {
                script {
                def scannerHome = tool 'sonar-scanner-4.7';
                    withSonarQubeEnv('SonarQube-Server') {
                        sh "${tool("sonar-scanner-4.7")}/bin/sonar-scanner -Dsonar.projectKey=node-metrics-app -Dsonar.projectName=node-metrics-app"
                    }
                }
            }
        }
        stage("Quality gate") {
            steps {
                script {
                    def qualitygate = waitForQualityGate()
                    sleep(10)
                    if (qualitygate.status != "OK") {
                        waitForQualityGate abortPipeline: true
                    }
                }
            }
        }              
        stage('Build Image') {
            steps {
                container('dind') {
                    script {
                        dockerImage = docker.build("${HarborServer}/${ImageUrl}:${ImageTag}")  
                    }
                }
            }
        }       
        stage('Push Image') {
            steps {
                container('dind') {
                    script {
                        docker.withRegistry( RegistryUrl, RegistryCredential ) {
                            dockerImage.push()
                        }
                    }
                }
            }
        }                 
    }
    post{
        success{
            qyWechatNotification failNotify: true, webhookUrl: 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=c79e3215-d39f-44a7-a760-fa0ab63ca46b'
        }
        failure{
            qyWechatNotification failNotify: true, webhookUrl: 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=c79e3215-d39f-44a7-a760-fa0ab63ca46b'
        }
    }
}
