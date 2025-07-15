# Azure Storage Account - KE Environment

## Summary

This repository defines the Terraform configuration used to provision an Azure Storage Account for the Kenya (KE) environment. The setup is part of a modular infrastructure-as-code approach to managing sandbox environments.

## Project Structure

```
.
├── env/
│   └── ke/
│       └── main.tf               # Country-specific deployment (Kenya)
├── module/
│   └── storage_account/
│       ├── main.tf               # Storage Account resource definition
│       ├── variables.tf
│       └── outputs.tf
└── README.md                     # This file
```

## Work Done Today

- Created a reusable `storage_account` module under `module/storage_account`.
- Configured the following for the storage account:
  - Unique name using a random suffix
  - Location: `westeurope`
  - Tier: `Standard`
  - Redundancy: `LRS`
  - HTTPS-only enabled
  - Public access disabled
- Used this module from `env/ke/main.tf` to deploy a KE-specific Storage Account.
- Ran `terraform init`, `terraform plan`, and `terraform apply` successfully.

## How to Deploy

```bash
cd env/ke
terraform init
terraform plan
terraform apply
```

## Next Steps

- Add tagging (e.g. environment, owner, cost center).
- Set up diagnostic settings for logging and metrics.
- Add role-based access control (RBAC) if required.
- Consider private endpoint setup and firewall rules for improved security.

## Notes

- Ensure Terraform is installed and available in your system PATH.
- The deployment currently uses local backend state — recommend switching to a remote backend for team use.
