pipeline {
    agent { dockerfile true }
    environment {
        AWS_DEFAULT_REGION="us-east-2"
    }

    stages {
        withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-terrauser', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {    
            stage('Install dependencies'){
                steps {
                        sh 'npm install @aws-cdk/aws-s3'
                }
            }
            stage('CDK bootstrap'){
                steps {
                    sh 'cdk bootstrap'
                }
            }
        }
    }
}