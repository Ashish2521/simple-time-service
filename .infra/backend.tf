terraform {
  backend "s3" {
    key    = "simpletimeservice/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
