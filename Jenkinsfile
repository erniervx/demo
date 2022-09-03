pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION="us-east-2"
    }

    stages {
//            stage('Install dependencies'){
//               steps {
//                      sh ''''
//                           npm install @aws-cdk/aws-s3'
//                        '''
//               }
//            }
            stage('Check access'){
                steps {
                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-terrauser', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'aws sts get-caller-identity'
                    }
                }
            }

            stage('CDK environment setup'){
                steps {
                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-terrauser', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {    
//                        sh '''
//                            python3 -m venv .venv
//                            source .venv/bin/activate
//                         '''
                        withPythonEnv('/usr/bin/python3') {
                            script {
                                sh "set -x"
                                sh "pip install -r requirements.txt"
                                sh "export PATH=$PATH:/var/lib/jenkins/.asdf/shims"
                                sh "cdk synth"
                                sh "cdk bootstrap"
                            }
                        }
                    }
                }
        }
    }
}