Deploying AWS Infrastructure with Terraform: A Practical Infrastructure as Code (IaC) Workflow
Project Overview

This project demonstrates the end-to-end workflow of provisioning cloud infrastructure on Amazon Web Services (AWS) using Terraform. It introduces the practical implementation of Infrastructure as Code (IaC) principles by automating the deployment, management, verification, and destruction of cloud resources through declarative configuration files.

The project focuses on building a foundational Terraform workflow that aligns with modern Cloud Engineering and DevOps best practices.

Infrastructure Deployment Workflow
Step 1: Create the Terraform Project Structure

Begin by creating a dedicated project directory for your Terraform configurations. Inside the project directory, create a primary Terraform configuration file named main.tf.

This file serves as the entry point for defining:

Cloud providers
Infrastructure resources
Variables
Networking components
Security configurations
Example Terraform Configuration
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create an EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
Technical Breakdown
Provider Block

The provider block specifies the cloud platform Terraform will interact with.

provider "aws" {
  region = "us-east-1"
}

This configuration:

Authenticates Terraform with AWS
Defines the AWS region for resource deployment
Downloads the required AWS provider plugins
Resource Block

The resource block defines the infrastructure component Terraform should create.

resource "aws_instance" "example"

This configuration:

Creates an Amazon EC2 virtual machine
Uses a specified Amazon Machine Image (AMI)
Defines the EC2 instance type
Key Parameters
Parameter	Description
ami	Defines the operating system image used for the EC2 instance
instance_type	Specifies the compute size and hardware configuration
aws_instance	Terraform resource type for EC2 instances
example	Logical resource name used internally by Terraform
Step 2: Initialize the Terraform Working Directory

Navigate to the project directory and initialize Terraform:

terraform init
What terraform init Does

This command:

Initializes the Terraform workspace
Downloads required provider plugins
Creates the .terraform directory
Prepares the environment for infrastructure deployment
Validates backend and provider configurations
Generated Components
Component	Purpose
.terraform/	Stores provider plugins and modules
.terraform.lock.hcl	Maintains provider version consistency
Step 3: Validate and Review the Execution Plan

Before deploying infrastructure, Terraform generates an execution plan to preview pending changes.

Run:

terraform plan
Purpose of terraform plan

This command:

Compares desired infrastructure with current infrastructure state
Identifies resources to create, modify, or destroy
Prevents accidental infrastructure changes
Provides infrastructure change visibility before deployment
Benefits
Infrastructure auditing
Safer deployments
Reduced configuration errors
Predictable infrastructure provisioning
Step 4: Apply the Terraform Configuration

Deploy the infrastructure using:

terraform apply

Terraform will display a detailed execution plan and request confirmation before creating resources.

Type:

yes

to proceed.

What Happens During Apply

Terraform will:

Authenticate with AWS
Create the EC2 instance
Generate infrastructure metadata
Store infrastructure state in the Terraform state file
Infrastructure State Tracking

Terraform automatically creates:

terraform.tfstate

This file tracks:

Resource IDs
Current infrastructure state
Resource dependencies
Configuration mappings
Step 5: Verify Provisioned Resources

After deployment, validate the infrastructure using:

AWS Management Console
AWS CLI
Terraform state commands
Example AWS CLI Verification
aws ec2 describe-instances
Verification Objectives

Ensure:

EC2 instance is running
Correct instance type is deployed
Proper AWS region is used
Tags and metadata are applied correctly
Step 6: Destroy Infrastructure Resources

To avoid unnecessary cloud costs, remove deployed infrastructure when no longer needed.

Run:

terraform destroy

Terraform will:

Generate a destruction plan
Request confirmation
Safely terminate managed resources
Important Note

terraform destroy permanently deletes infrastructure resources defined in the Terraform configuration.

Always review the destruction plan carefully before approval.

Terraform Workflow Summary
Command	Purpose
terraform init	Initialize Terraform environment
terraform plan	Preview infrastructure changes
terraform apply	Deploy infrastructure resources
terraform destroy	Remove managed infrastructure
Technologies Used
Terraform
Amazon Web Services (AWS)
EC2
HashiCorp Configuration Language (HCL)
Git & GitHub
Skills Demonstrated
Infrastructure as Code (IaC)
Cloud Infrastructure Provisioning
AWS Resource Automation
Terraform State Management
Infrastructure Lifecycle Management
DevOps Workflow Fundamentals
Cloud Environment Deployment Automation
Author

Olaoluwa Bamidele
