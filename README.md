# Terraform AWS Infrastructure (Lesson 5)

## 📂 Project Structure

```plaintext
lesson-7/
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
│   ├── ecr/        # Module for Elastic Container Registry
│   │   ├── ecr.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── eks/.       # Module for EKS Cluster
│       ├── eks.tf
│       ├── node.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── charts/         # Helm charts
│   └── django-app/ # Django Helm chart
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│           ├── deployment.yaml
│           ├── service.yaml
│           ├── configmap.yaml
│           └── hpa.yaml
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

### Helm

#### Connect to the EKS cluster

```bash
aws eks update-kubeconfig --region us-east-1 --name eks-cluster-django
```

#### Go to the chart directory

```bash
cd charts/django-app
```

#### Install the Django application

```bash
helm install django-app .
```

#### Upgrade the deployment after modifying values.yaml

```bash
helm upgrade django-app .
```

#### Uninstall the release

```bash
helm uninstall django-app
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

### 4. **eks**

- Deploys an **Amazon EKS cluster**.
- Creates a **node group** (EC2 worker nodes).
- Configures **IAM roles** and **kubeconfig**.
- Prepares the infrastructure for deploying applications via **Helm**.

### 5. **django-app Helm chart**

- **Deployment**: runs a Django container from **ECR**.
- **Service**: exposes the app via `LoadBalancer` for external access.
- **ConfigMap & Secret**: provide environment variables (**Postgres**).
- **HPA**: automatically scales pods (2–6) when CPU load >70%.
