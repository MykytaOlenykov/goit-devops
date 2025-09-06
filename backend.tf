terraform {
  backend "s3" {
    bucket         = "goit-lesson-5-mo"
    key            = "lesson-5/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
