# Terraform AWS Infrastructure (Lesson 5)

## 📂 Project Structure

```plaintext
lesson-5/
│
├── main.tf         # Main file for connecting modules
├── backend.tf      # Backend configuration (S3 + DynamoDB)
├── outputs.tf      # Global outputs
│
├── modules/        # Modules directory
│   ├── s3-backend/ # Module for S3 and DynamoDB
│   │   ├── s3.tf
│   │   ├── dynamodb.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── vpc/        # Module for network infrastructure
│   │   ├── vpc.tf
│   │   ├── routes.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── ecr/        # Module for Elastic Container Registry
│       ├── ecr.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── README.md       # Project documentation
```

## 🚀 Commands to Run

1. Initialize Terraform:

```bash
terraform init
```

2. Preview the plan:

```bash
terraform plan
```

3. Apply changes (deploy infrastructure):

```bash
terraform apply
```

4. Destroy resources:

```bash
terraform destroy
```

## 📦 Module Explanation

### 1. **s3-backend**

- Creates an S3 bucket to store Terraform state files.
- Enables versioning for secure history tracking.
- Creates a DynamoDB table for state locking to prevent conflicts.

### 2. **vpc**

- Creates a VPC with a specified CIDR block.
- Configures 3 public and 3 private subnets.
- Adds Internet Gateway and NAT Gateway.
- Sets up route tables for networking.

### 3. **ecr**

- Creates an Elastic Container Registry (ECR) to store Docker images.
- Enables image scanning on push to detect vulnerabilities.
- Configures access policies.
