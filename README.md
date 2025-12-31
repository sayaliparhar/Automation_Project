# DevOps Automation for Edutech Platform

![Architecture](https://img.shields.io/badge/Architecture-Microservices-blue)
![Infrastructure](https://img.shields.io/badge/IaC-Terraform-purple)
![Container](https://img.shields.io/badge/Container-Docker-blue)
![Orchestration](https://img.shields.io/badge/Orchestration-Kubernetes-326CE5)
![CI/CD](https://img.shields.io/badge/CI%2FCD-Jenkins-D24939)
![Cloud](https://img.shields.io/badge/Cloud-AWS-FF9900)

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Future Enhancements](#future-enhancements)
- [Contributing](#contributing)
- [License](#license)

## 🌟 Overview

**Coding Cloud Hub** is a full-stack web application for course enquiry management, which is deployed using production-grade DevOps practices. This project showcases:

- **Infrastructure as Code** using Terraform
- **Container orchestration** with Kubernetes (kubeadm cluster)
- **Automated CI/CD** pipelines with Jenkins
- **Microservices architecture** deployed on AWS
- **Database management** with AWS RDS MySQL
- **Automated cluster setup** with custom AMI, Shellscripting and S3 token sharing

### What This Project Demonstrates

✅ **Complete DevOps Lifecycle** - From infrastructure provisioning to application deployment  
✅ **Cloud-Native Architecture** - Microservices running on Kubernetes  
✅ **Automation** - Terraform for infrastructure, Jenkins for CI/CD  
✅ **Security Best Practices** - Private subnets, security groups, IAM roles  
✅ **Scalability** - Kubernetes deployments with replica management  
✅ **Real-World Patterns** - NAT Gateway, bastion host, RDS, container registry

## 🏗️ Architecture
### Application Architecture

```
User Request
    ↓
ALB (Security Group)
    ↓
Target Group
    ↓
K8s Worker Node (Private) :31000
    ↓
Nginx Service (ClusterIP)
    ↓
    ├──→ Frontend Pods (React)
    │    └── Nginx serving static files
    │
    └──→ Backend Pods (Node.js/Express)
         └── API endpoints
              ↓
         RDS MySQL Database
         └── Enquiry data storage
```

## 🛠️ Tech Stack

### Infrastructure & Cloud
- **Cloud Provider:** AWS (EC2, VPC, RDS, S3, NAT Gateway)
- **IaC:** Terraform
- **AMI Building:** Packer 
- **Container Orchestration:** Kubernetes (kubeadm)
- **Networking:** VPC, Subnets, Security Groups, Route Tables
- ALB: For traffic distribution

### Application
- **Frontend:** React, Vite, TailwindCSS, shadcn/ui
- **Backend:** Node.js, Express.js
- **Database:** MySQL (AWS RDS)
- **Containerization:** Docker
- **Reverse Proxy:** Nginx

### CI/CD & Automation
- **CI/CD:** Jenkins (Multi-job pipeline)
- **Version Control:** Git, GitHub
- **Container Registry:** DockerHub
- **Automation Scripts:** Bash, Shell scripts

### Kubernetes Components
- **CNI:** Flannel
- **Service Types:** ClusterIP, NodePort
- **Workloads:** Deployments, Pods
- **Config Management:** ConfigMaps, Secrets

## 📁 Project Structure

```
Edutech Platform DevOps Automation/
│
├── frontend/                    # React application
│   ├── src/
│   │   ├── components/         # Reusable components
│   │   ├── pages/              # Page components
│   │   │   └── Enquiry.tsx     # Main enquiry form
│   │   └── App.tsx
│   ├── Dockerfile              # Frontend container image
│   ├── nginx.conf              # Nginx config for serving
│   └── package.json
│
├── backend/                    # Express.js API
│   ├── server.js               # Main server file
│   ├── Dockerfile              # Backend container image
│   ├── .env                    # Environment variables
│   └── package.json
│
├── k8s/                        # Kubernetes manifests
│   ├── namespace.yaml          # Namespace definition
│   ├── configmap.yaml          # Nginx configuration
│   ├── backend-deployment.yaml # Backend workload
│   ├── frontend-deployment.yaml# Frontend workload
│   └── nginx-deployment.yaml   # Reverse proxy
│
├── terraform/                  # Infrastructure as Code
│   ├── main.tf                 # Main configuration
│   ├── variables.tf            # Variable definitions
│   ├── outputs.tf              # Output value
│   │
│   ├── modules/
│   │   ├── vpc/                # VPC module
│   │   ├── ec2/                # EC2 instances
│   │   ├── rds/                # RDS database
│   │
│   └── user-data/
│       ├── master-init.sh      # K8s master initialization
│       ├── worker-join.sh      # K8s worker join script
│
├── jenkins/                    # Jenkins job definitions
│   ├── Frontend.Jenkinsfile    # Frontend build pipeline
    ├── Backend.Jenkinsfile     # Backend build pipeline
│   ├── Deploy.Jenkinsfile      # Deployment pipeline
│   └── Rollback.Jenkinsfile    # Rollback pipeline
│
├── docs/                       # Documentation
│   ├── Project-Documentation
│   ├── Workflows.pdf
│
├── .gitignore
├── README.md
└── LICENSE
```

## 🚀 Features

### Application Features
- 📝 **Course Enquiry Form** - User-friendly form for course inquiries
- 💾 **Data Persistence** - Enquiries stored in MySQL database
- 🎨 **Modern UI** - Built with React and TailwindCSS
- 📱 **Responsive Design** - Works on all devices
- ✅ **Form Validation** - Client and server-side validation
- 🔔 **Toast Notifications** - User feedback on actions

### DevOps Features
- 🏗️ **Infrastructure as Code** - Complete infrastructure defined in Terraform
- 🐳 **Containerized Services** - All services run in Docker containers
- ☸️ **Kubernetes Orchestration** - Automated deployment and scaling
- 🔄 **CI/CD Automation** - Automated build and deployment pipeline
- 🔒 **Security Best Practices** - Private subnets, security groups, secrets management
- 📊 **High Availability** - Multiple pod replicas, health checks
- 🔧 **Easy Rollback** - One-click rollback to previous version
- 📈 **Scalability** - Horizontal pod scaling capability
- 🌐 **Network Isolation** - Public/private subnet architecture
- 🔑 **Token-Based Authentication** - S3-based cluster token sharing

## 📋 Prerequisites

### Local Development
- Git
- Docker Desktop
- Node.js 18+
- kubectl
- Terraform 1.0+
- AWS CLI configured

### AWS Account
- AWS account with appropriate permissions
- IAM user with programmatic access
- AWS CLI configured with credentials

### Required AWS Resources
- VPC with public and private subnets
- NAT Gateway for private subnet internet access
- EC2 instances (t3.small or higher)
- RDS MySQL instance (db.t3.micro or higher)
- S3 bucket for state/token storage

### Tools & Services
- GitHub account
- DockerHub account
- SSH key pair for EC2 access

---

## ⚡ Quick Start

### 1. Clone Repository

```bash
git clone https://github.com/your-username/Edutech-Platform-DevOps-Automation.git
cd Edutech-Platform-DevOps-Automation
```

### 2. Setup AWS Credentials

```bash
Setup the credentials in Provider.tf
# Enter your AWS Access Key ID
# Enter your AWS Secret Access Key
# Default region: ap-south-1
# Default output format: json
```

### 3. Deploy Infrastructure

```bash
cd terraform

# Initialize Terraform
terraform init

# Review planned changes
terraform plan

# Apply infrastructure
terraform apply -auto-approve

# Save output values
terraform output > ../outputs.txt
```

**This will create:**
- VPC with public and private subnets
- 4 EC2 instances (K8s master, worker, Jenkins, Docker)
- RDS MySQL instance
- Security groups and IAM roles
- S3 bucket for token sharing
- Kubernetes cluster (auto-configured)

### 5. Setup Jenkins

```bash
# Get Jenkins URL
JENKINS_IP=$(terraform output -raw jenkins_public_ip)
echo "Jenkins URL: http://${JENKINS_IP}:8080"

# Get initial admin password
ssh -i your-key.pem ubuntu@${JENKINS_IP} \
  "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
```

### 6. Configure CI/CD Pipeline

1. Open Jenkins at `http://<jenkins-ip>:8080`
2. Install suggested plugins
3. Setup the Global Credentials
3. Create jobs from jenkins/ directory
4. Configure GitHub webhook
5. Trigger first build!
---

## 🔮 Future Enhancements

### Phase 1: Monitoring & Observability
- [ ] Prometheus for metrics collection
- [ ] Grafana dashboards
- [ ] ELK stack for centralized logging
- [ ] CloudWatch integration
- [ ] Alerting with AlertManager

### Phase 2: Advanced Kubernetes
- [ ] Horizontal Pod Autoscaler (HPA)
- [ ] Ingress Controller (instead of NodePort)
- [ ] cert-manager for SSL/TLS
- [ ] Network Policies
- [ ] Resource quotas and limits

### Phase 3: Security Enhancements
- [ ] Secrets management with HashiCorp Vault
- [ ] Image scanning with Trivy
- [ ] RBAC implementation
- [ ] Pod Security Policies
- [ ] AWS WAF integration

### Phase 4: CI/CD Improvements
- [ ] Multi-environment deployments (Dev, Staging, Prod)
- [ ] Blue-Green deployment strategy
- [ ] Canary releases
- [ ] Automated testing (unit, integration, e2e)
- [ ] Code quality gates with SonarQube

### Phase 5: Performance & Reliability
- [ ] Redis caching layer
- [ ] Database read replicas
- [ ] CDN for static assets
- [ ] Multi-region deployment
- [ ] Disaster recovery setup

### Phase 6: Developer Experience
- [ ] Local development with minikube/kind
- [ ] GitOps with ArgoCD
- [ ] Service mesh with Istio
- [ ] API Gateway
- [ ] Developer documentation portal
---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

### Coding Standards
- Follow existing code style
- Add comments for complex logic
- Update documentation
- Test changes before submitting

---

## 👥 Authors

- **Pritam Phdatare** - *Initial work* - [YourGitHub](https://github.com/Pritam-Phadtare)

---

## 🙏 Acknowledgments

- Kubernetes documentation and community
- AWS documentation
- Jenkins community plugins
- Open source contributors

## 📞 Support

For questions and support:
- 📧 Email: pritamphadtare74@gmail.com
- 💬 GitHub Issues: [Create an issue](https://github.com/Pritam-Phadtare/Edutech-Platform-DevOps-Automation/issues)
- 📖 Documentation: [Wiki](https://github.com/Pritam-Phadtare/Edutech-Platform-DevOps-Automation/wiki)

---

## 📊 Project Stats

![GitHub stars](https://img.shields.io/github/stars/Pritam-Phadtare/Edutech-Platform-DevOps-Automation
?style=social)

![GitHub forks](https://img.shields.io/github/forks/Pritam-Phadtare/Edutech-Platform-DevOps-Automation
?style=social)

![GitHub issues](https://img.shields.io/github/issues/Pritam-Phadtare/Edutech-Platform-DevOps-Automation
)

![GitHub pull requests](https://img.shields.io/github/issues-pr/Pritam-Phadtare/Edutech-Platform-DevOps-Automation
)

---

**Built with ❤️ for DevOps learning and demonstration**


