pipeline {
    agent any

    parameters {
            booleanParam(name: 'PLAN_TERRAFORM', defaultValue: false, description: 'Check to plan Terraform changes')
            booleanParam(name: 'APPLY_TERRAFORM', defaultValue: false, description: 'Check to apply Terraform changes')
            booleanParam(name: 'DESTROY_TERRAFORM', defaultValue: false, description: 'Check to apply Terraform changes')
            choice(name: "Environment", choices: ['DEV', 'STG', 'PRD'], description: 'Select Env', required: true),
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clean workspace before cloning (optional)
                deleteDir()

                // Clone the Git repository
                git branch: 'main',
                    url: 'https://github.com/rahulwagh/devops-project-1.git'

                sh "ls -lart"
            }
        }

        stage('Terraform Init') {
                    steps {
                       withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails-rwagh']]){
                            dir('infra') {
                            sh 'echo "=================Terraform Init=================="'
                            sh 'terraform init'
                        }
                    }
                }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    if (params.PLAN_TERRAFORM) {
                       withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails-rwagh']]){
                            dir('infra') {
                                if (params.Environment == 'DEV') {
                                sh 'echo "=================Terraform Plan Dev=================="'
                                sh 'terraform plan -var="my_env=dev"'
                                }
                                if (params.Environment == 'STG') {
                                sh 'echo "=================Terraform Plan Stg=================="'
                                sh 'terraform plan -var="my_env=stg"'
                                }
                                if (params.Environment == 'PRD') {
                                sh 'echo "=================Terraform Plan Prd=================="'
                                sh 'terraform plan -var="my_env=prd"'
                                }
                            }
                        }
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    if (params.APPLY_TERRAFORM) {
                       withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails-rwagh']]){
                            dir('infra') {
                                 if (params.Environment == 'DEV') {
                                sh 'echo "=================Terraform Plan Dev=================="'
                                sh 'terraform apply -var="my_env=dev"'
                                }
                                if (params.Environment == 'STG') {
                                sh 'echo "=================Terraform Plan Stg=================="'
                                sh 'terraform apply -var="my_env=stg"'
                                }
                                if (params.Environment == 'PRD') {
                                sh 'echo "=================Terraform Plan Prd=================="'
                                sh 'terraform apply -var="my_env=prd"'
                                }
                            }
                        }
                    }
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                script {
                    if (params.DESTROY_TERRAFORM) {
                       withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails-rwagh']]){
                            dir('infra') {
                               if (params.Environment == 'DEV') {
                                sh 'echo "=================Terraform Plan Dev=================="'
                                sh 'terraform destroy -var="my_env=dev"'
                                }
                                if (params.Environment == 'STG') {
                                sh 'echo "=================Terraform Plan Stg=================="'
                                sh 'terraform destroy -var="my_env=stg"'
                                }
                                if (params.Environment == 'PRD') {
                                sh 'echo "=================Terraform Plan Prd=================="'
                                sh 'terraform destroy -var="my_env=prd"'
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}