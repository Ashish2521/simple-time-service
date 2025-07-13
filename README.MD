# SimpleTimeService 🕒

**SimpleTimeService** is a miniomal python app built using FLASK . This app is built as a basic block for deploying a python app on Cloud using
---

## 📦 Features

- ✅ Returns current UTC time
- ✅ Clean modular structure

---

## 📁 Project Structure
```bash
simple-time-service/
├── .infra/                        # Terraform infrastructure code
│   ├── backend.tf                 # S3 remote backend config
│   ├── main.tf                    # Root Terraform config
│   ├── variables.tf               # Root variable definitions
│   ├── terraform.tfvars           # Variable values (ignored in git)
│   └── modules/                   # Custom Terraform modules
│       ├── vpc/                   # VPC definition
│       ├── public_subnet/         # Public subnet module
│       ├── private_subnet/        # Private subnet module
│       ├── route_table/           # Route tables
│       ├── igw/                   # Internet Gateway
│       ├── nat_gateway/           # NAT Gateway
│       ├── ecs_cluster/           # ECS cluster config
│       ├── ecs_service/           # ECS service and task definition
│       └── alb/                   # Application Load Balancer
│
├── app/                           # Flask app code
│   ├── __init__.py                # Flask app factory
│   └── routes.py                  # Route definitions
│
├── main.py                        # App entry point
├── requirements.txt               # Python dependencies
└── README.md                      # Project documentation
```


---

☁️ Cloud Architecture
This project is deployed using the following cloud architecture:

🧭 VPC with 2 public and 2 private subnets

🐳 ECS Fargate Cluster running in private subnets

🌐 Application Load Balancer (ALB) in public subnets forwarding traffic to ECS

🛠️ Terraform to provision all AWS infrastructure

📦 Docker Hub to store and pull the container image

🐳 Docker Image
📛 Image Name: ashish2521/simpletimeservice:v1

🔌 Exposed Port: 8000

👤 Security: Runs as a non-root user for best practice in container security

🛠️ Local Development
📋 Prerequisites
🐍 Python 3.8+

📦 pip installed (Python package manager)

🚀 Run Locally
```bash
git clone https://github.com/Ashish2521/simple-time-service.git
cd simple-time-service
pip install -r requirements.txt
python main.py
Visit http://127.0.0.1:8000/ in Postman or browser to fetch current UTC time.

```

🚀 Steps to Deploy
```bash
# 1. Clone the repo locally and navigate to infra folder
git clone https://github.com/Ashish2521/simple-time-service.git
cd simple-time-service/.infra
cd .infra

# 2. Set the backend bucket name that you want to use as a remote backend via environment variable
export TF_BACKEND_BUCKET="your-s3-bucket-name"

# 3. Initialize Terraform with dynamic bucket
terraform init -backend-config="bucket=$TF_BACKEND_BUCKET"

# 4. Validate the Terraform configuration
terraform validate

# 5. Preview the execution plan
terraform plan

# 6. Apply the infrastructure
terraform apply -auto-approve
🧾 Outputs
After apply, you’ll see output like:


alb_dns_name = simpletimeservice-alb-123456789.us-east-1.elb.amazonaws.com
Access your Flask app at:

http://<alb_dns_name>/
```
🧹 Teardown
```bash
To destroy all infrastructure:

terraform destroy -auto-approve

```

👨‍💻 Author
```bash
Ashish Sharma
GitHub: @Ashish2521
LinkedIn: linkedin.com/in/ashish2521
```