# Medusa Backend Deployment with Terraform and GitHub Actions

This repository contains the Infrastructure as Code (IaC) for deploying the Medusa open-source headless commerce platform backend using Terraform on AWS ECS/Fargate. It also includes a CI/CD pipeline setup using GitHub Actions.

## 🛠️ Terraform Configuration

### Overview

- **Provider**: AWS ![AWS Logo](https://img.shields.io/badge/AWS-232F3E?style=flat&logo=amazonaws&logoColor=white)
- **Resources**:
  - **VPC**: A Virtual Private Cloud to isolate your network.
  - **Subnet**: A subnet within the VPC for resource placement.
  - **Security Group**: Defines inbound and outbound traffic rules.
  - **IAM Role**: Permissions for ECS tasks.
  - **ECS Cluster**: Manages the container instances.
  - **ECS Task Definition**: Specifies container details and requirements.
  - **ECS Service**: Manages deployment and scaling of the containers.

### Key Components

- **AWS VPC**: Creates a network space for your resources.
- **AWS Subnet**: Defines a segment within the VPC.
- **AWS Security Group**: Controls network access.
- **AWS IAM Role**: Grants permissions to ECS tasks.
- **AWS ECS Cluster**: Container orchestration.
- **AWS ECS Task Definition**: Container configuration.
- **AWS ECS Service**: Manages container instances and scaling.

### HCL Configuration

![HCL Logo](https://img.shields.io/badge/HCL-5F2B8A?style=flat&logo=hashicorp&logoColor=white)  
Terraform configurations are written in HashiCorp Configuration Language (HCL), defining the necessary AWS resources and their settings.

## 🚀 GitHub Actions CI/CD Pipeline

### Workflow

The GitHub Actions workflow automates the deployment process. It performs the following steps:

1. **Checkout Code**: Retrieves the code from the repository.
2. **Set Up Terraform**: Installs Terraform on the runner.
3. **Terraform Init**: Initializes the Terraform configuration.
4. **Terraform Plan**: Prepares an execution plan for Terraform.
5. **Terraform Apply**: Applies the configuration to AWS.

### GitHub Actions Configuration

![GitHub Actions Logo](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat&logo=github&logoColor=white)  
The pipeline is defined in `.github/workflows/deploy.yml`.

## 📹 Video Explanation

A video explaining the Terraform code, deployment setup, and the CI/CD pipeline can be found [here](https://your-video-link). The video includes a walkthrough of the setup process and a demonstration of the deployment.

## 📜 Certifications

![AWS Educate Getting Started with Storage](https://img.shields.io/badge/AWS_Educate_Getting_Started_with_Storage-232F3E?style=flat&logo=amazonaws&logoColor=white)  
![AWS Educate Getting Started with Cloud Ops](https://img.shields.io/badge/AWS_Educate_Getting_Started_with_Cloud_Ops-232F3E?style=flat&logo=amazonaws&logoColor=white)  
![Microsoft Certified: Azure Fundamentals](https://img.shields.io/badge/Microsoft_Certified_Azure_Fundamentals-0078D4?style=flat&logo=microsoft&logoColor=white)  
![Cybersecurity Essentials](https://img.shields.io/badge/Cybersecurity_Essentials-0033A0?style=flat&logo=cisco&logoColor=white)  
![Introduction to Cybersecurity](https://img.shields.io/badge/Introduction_to_Cybersecurity-0033A0?style=flat&logo=cisco&logoColor=white)  
![AWS Cloud Quest: Cloud Practitioner](https://img.shields.io/badge/AWS_Cloud_Quest_Cloud_Practitioner-232F3E?style=flat&logo=amazonaws&logoColor=white)  
![Microsoft Certified: Power Platform Fundamentals](https://img.shields.io/badge/Microsoft_Certified_Power_Platform_Fundamentals-0078D4?style=flat&logo=microsoft&logoColor=white)  
![Microsoft Certified: Azure AI Fundamentals](https://img.shields.io/badge/Microsoft_Certified_Azure_AI_Fundamentals-0078D4?style=flat&logo=microsoft&logoColor=white)  
![Microsoft 365 Certified: Fundamentals](https://img.shields.io/badge/Microsoft_365_Certified_Fundamentals-0078D4?style=flat&logo=microsoft&logoColor=white)  
![Build Your Own Chatbot - Level 1](https://img.shields.io/badge/Build_Your_Own_Chatbot_Level_1-0F4C81?style=flat&logo=ibm&logoColor=white)  
![AWS Knowledge: Cloud Essentials](https://img.shields.io/badge/AWS_Knowledge_Cloud_Essentials-232F3E?style=flat&logo=amazonaws&logoColor=white)

---

### Bhanu Sandeep Vellalacheruvu

Check out my [Credly profile](https://www.credly.com/users/bhanu-sandeep-vellalacheruvu/edit) for more details on my certifications.
