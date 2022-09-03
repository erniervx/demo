pipeline {
    agent { dockerfile true }
    environment {
        AWS_DEFAULT_REGION="us-east-2"
    }

    stages {
        stage('Install dependencies'){
            steps {
                dir(path: 'sources') {
                    sh 'npm install @aws-cdk/aws-s3'
                }
            }
        }

    }
}