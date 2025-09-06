# Connect the S3 and DynamoDB module
module "s3_backend" {
  source      = "./modules/s3-backend"
  bucket_name = "goit-lesson-5-mo"
  table_name  = "terraform-locks"
}

# Connect the VPC module
module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets    = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_name           = "goit-lesson-5-vpc"
}

# Connect the ECR module
module "ecr" {
  source      = "./modules/ecr"
  repository_name = "goit-lesson-5-ecr"
  scan_on_push = true
  image_tag_mutability = "MUTABLE"
}