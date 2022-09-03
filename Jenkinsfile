pipeline {
    agent { any }
    environment {
        AWS_DEFAULT_REGION="us-east-2"
    }

    stages {
            stage('Install dependencies'){
               steps {
                      sh ''''
                           npm install @aws-cdk/aws-s3'
                        '''
                }
            }
            stage('Check access'){
                steps {
                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-terrauser', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'aws sts get-caller-identity'
                    }
                }
            }

            stage('CDK bootstrap'){
                steps {
                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-terrauser', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {    
                        sh 'cdk bootstrap'
                    }
                }
            }
    }
}