terraform {
  backend "s3" {
    bucket = "${var.my_env}-proj-1-remote-state-bucket-krish"
    key    = "devops-project-1/terraform.tfstate"
    region = "eu-central-1"
  }
}