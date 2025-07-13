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
├── app/
│ ├── init.py # Flask app factory
│ └── routes.py # Route definitions
├── main.py # App entry point
├── requirements.txt # Dependencies
└── README.md
```


---

☁️ Cloud Architecture
VPC with 2 public and 2 private subnets

ECS Fargate cluster in private subnets

ALB in public subnets forwarding traffic to ECS

Terraform used to automate all resource provisioning

Docker Hub used as the container registry


🐳 Docker Image
Image: ashish2521/simpletimeservice:v1

Port: 8000

Runs as a non-root user

🛠️ Local Development
📋 Prerequisites
Python 3.8+

pip installed

🚀 Run Locally
```bash
git clone https://github.com/Ashish2521/simple-time-service.git
cd simple-time-service
pip install -r requirements.txt
python main.py
Visit http://127.0.0.1:8000/ in Postman or browser to fetch current UTC time.

🚀 Cloud Deployment (Infrastructure Summary)
This app is deployed using:

AWS Services: VPC, ECS (Fargate), ALB, IAM, Security Groups, Subnets

Terraform Modules: custom-built for VPC, Subnets, Route Tables, ALB, ECS Cluster, ECS Task & Service

Docker Hub: hosts the container image. Please note i have deployed the image publicly.

Private Networking: app runs in private subnets and is reachable via ALB in public subnets

👨‍💻 Author
Ashish Sharma
GitHub: @Ashish2521
LinkedIn: linkedin.com/in/ashish2521

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
🧹 Teardown
To destroy all infrastructure:

terraform destroy -auto-approve

```