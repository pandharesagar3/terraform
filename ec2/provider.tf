provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket         = "neo-soft-terraform-backend"
    key            = "neosoft-CNET/neosoftCNET.tfstate"
    region         = "ap-south-1"
    # dynamodb_table = "your_dynamodb_table_name" // Optional for state locking
  }
}
