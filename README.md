# aws-secure-iac-demo

Purpose: Demonstrate a security-focused implementation of AWS Infrastructure as Code (IaC)

## Project Contents

Use Terraform (with Terragrunt) to provision AWS resources with a security-first approach.


Implement least privilege principles for:

- S3 Bucket – with public access explicitly enabled or disabled
- IAM Policies – with tightly scoped permissions
- VPC + Subnets (optional)

Include security-related AWS services, such as:

- AWS WAF – Web Application Firewall
- AWS CloudTrail – For audit logging

Tech Stack: Terraform, Terragrunt, AWS IAM / S3 / WAF

## Setup & Deployment

## Install Terraform and Terragrunt

### 1. Install Terraform

Run the following commands to download and install Terraform (tested on Ubuntu Linux):

```bash
# Follow the instruction on Terraform website 
# https://developer.hashicorp.com/terraform/install
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# Verify installation
terraform version
```
### 2. Install Terragrunt

```bash
# Download Terragrunt (update version as needed)
# https://github.com/gruntwork-io/terragrunt/releases
TERRAGRUNT_VERSION="0.82.3"
wget https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64

# Make it executable
chmod +x terragrunt_linux_amd64

# Move to /usr/local/bin
sudo mv terragrunt_linux_amd64 /usr/local/bin/terragrunt

# Verify installation
terragrunt --version
```

### Deployment
``` bash
cd live/dev
terragrunt init
terragrunt plan
terragrunt apply
```