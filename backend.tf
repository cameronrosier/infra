
terraform {
  backend "s3" {
    bucket = "robopd2-terraform"
    key    = "robopd2.tfstate"
    region = "us-east-1"
  }
}
