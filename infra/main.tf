module "app" {
  source              = "./infra"
  my_env              = var.my_env
  vpc_cidr            = var.vpc_cidr

  vpc_name            = "${var.my_env}-proj-eu-central-vpc-1"

  cidr_public_subnet  = (
    var.my_env == "dev" ? ["10.0.1.0/24", "10.0.2.0/24"] :
    var.my_env == "stg" ? ["10.0.5.0/24", "10.0.6.0/24"] :
    var.my_env == "prd" ? ["10.0.9.0/24", "10.0.10.0/24"] : []
  )

  cidr_private_subnet = (
    var.my_env == "dev" ? ["10.0.3.0/24", "10.0.4.0/24"] :
    var.my_env == "stg" ? ["10.0.7.0/24", "10.0.8.0/24"] :
    var.my_env == "prd" ? ["10.0.11.0/24", "10.0.12.0/24"] : []
  )
}
