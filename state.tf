terraform {
  backend "s3" {
    bucket         = "terraform-infrastructure-k13"
    dynamodb_table = "terraform-infrastructure-k13"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
  }
}
