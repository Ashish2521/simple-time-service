terraform {
  backend "s3" {
    bucket = "ashish-terraform-state"
    key    = "simpletimeservice/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
