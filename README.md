[![Terraform Version](https://img.shields.io/badge/Terraform-v1.0.0%2B-blue)](https://www.terraform.io/downloads.html)
[![azurerm Version](https://img.shields.io/badge/azurerm-v3.86.0-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
[![License](https://img.shields.io/badge/License-MIT-green)](https://opensource.org/licenses/MIT)

# Web Infrastructure Stack


This Terraform module deploys a web infrastructure stack on Azure, including:

- Resource Group
- Virtual Network with subnets
- Network Security Groups for web and DB subnets
- Virtual Machines for web and DB tiers
- Load Balancer for web VMs
- Application Gateway
- SQL Server and Database
- Key Vault
- Backup and security for VMs

## Modules

The project is modularized with each component being a separate module. The modules are located under the `modules/` directory.

## How to Use

1. Clone the repository.
2. Navigate to the project root directory.
3. Create a `terraform.tfvars` file (or modify the existing one) with your own values.
NB:  Key vault name may only contain alphanumeric characters and dashes and must be between 3-24 chars
4. Run the following Terraform commands:

```bash
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
