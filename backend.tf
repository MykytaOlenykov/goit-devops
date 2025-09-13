terraform {
  backend "s3" {
    bucket         = "goit-mo-lesson-devops"
    key            = "goit-mo/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
