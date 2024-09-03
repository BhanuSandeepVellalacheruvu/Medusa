# Medusa Backend Deployment with Terraform and GitHub Actions

This repository contains the Infrastructure as Code (IaC) for deploying the Medusa open-source headless commerce platform backend using Terraform on AWS ECS/Fargate. It also includes a CI/CD pipeline setup using GitHub Actions.

## 🛠️ Terraform Configuration

### Overview

- **Provider**: AWS
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
