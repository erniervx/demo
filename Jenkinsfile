pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
        }
    }
    environment {
        AWS_DEFAULT_REGION="us-east-2"
    }

    stage {
        stage('Install dependencies'){
            steps {
                dir(path: 'sources') {
                    sh 'npm install @aws-cdk/aws-s3'
                }
            }
        }

    }
}
