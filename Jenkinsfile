pipeline {
    agent any

    parameters {
        booleanParam(name: 'PLAN_TERRAFORM', defaultValue: false, description: 'Check to plan Terraform changes')
        booleanParam(name: 'APPLY_TERRAFORM', defaultValue: false, description: 'Check to apply Terraform changes')
        booleanParam(name: 'DESTROY_TERRAFORM', defaultValue: false, description: 'Check to destroy Terraform resources')
        choice(name: "Environment", choices: ['DEV', 'STG', 'PRD'], description: 'Select Env')
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clean workspace before cloning (optional)
                deleteDir()

                // Clone the Git repository
                git branch: 'main',
                    url: 'https://github.com/krishchadha/infra-terraform'

                sh "ls -lart"
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails-krish']]) {
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
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails-krish']]) {
                            dir('infra') {
                                if (params.Environment == 'DEV') {
                                    sh 'echo "=================Terraform Plan Dev=================="'
                                    sh 'terraform plan -var="my_env=dev"'
                                } else if (params.Environment == 'STG') {
                                    sh 'echo "=================Terraform Plan Stg=================="'
                                    sh 'terraform plan -var="my_env=stg"'
                                } else if (params.Environment == 'PRD') {
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
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails-krish']]) {
                            dir('infra') {
                                if (params.Environment == 'DEV') {
                                    sh 'echo "=================Terraform Apply Dev=================="'
                                    sh 'terraform apply -var="my_env=dev" -auto-approve'
                                } else if (params.Environment == 'STG') {
                                    sh 'echo "=================Terraform Apply Stg=================="'
                                    sh 'terraform apply -var="my_env=stg" -auto-approve'
                                } else if (params.Environment == 'PRD') {
                                    sh 'echo "=================Terraform Apply Prd=================="'
                                    sh 'terraform apply -var="my_env=prd" -auto-approve'
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
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails-krish']]) {
                            dir('infra') {
                                if (params.Environment == 'DEV') {
                                    sh 'echo "=================Terraform Destroy Dev=================="'
                                    sh 'terraform destroy -var="my_env=dev" -auto-approve'
                                } else if (params.Environment == 'STG') {
                                    sh 'echo "=================Terraform Destroy Stg=================="'
                                    sh 'terraform destroy -var="my_env=stg" -auto-approve'
                                } else if (params.Environment == 'PRD') {
                                    sh 'echo "=================Terraform Destroy Prd=================="'
                                    sh 'terraform destroy -var="my_env=prd" -auto-approve'
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
