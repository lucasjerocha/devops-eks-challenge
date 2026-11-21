# DevOps EKS Challenge

> **Status: incomplete / in progress.** This repository contains my local implementation of the KubeDev EKS challenge. I am following the original walkthrough and comparing my implementation with the [reference repository](https://github.com/KubeDev/live-desafio-tech-01) before calling the work complete. It has not been verified as a production deployment.

## Goal

Provision an AWS VPC and an Amazon EKS cluster with Terraform, with at least two worker nodes. The challenge also calls for a GitHub Actions workflow that runs when the Terraform configuration changes, plus reproducible setup documentation.

## Current implementation

- Terraform modules configure a VPC with public and private subnets, NAT, and a VPN gateway.
- Terraform configures an EKS managed node group with two `t3.small` instances.
- The cluster API endpoint is public. Restricting its access and reviewing the security configuration remain open work.
- `terraform validate` succeeds locally; the downloaded EKS module currently emits a deprecated Kubernetes resource warning.

## Still to complete

- Finish the walkthrough and compare the implementation with the original challenge.
- Add and verify the GitHub Actions workflow for Terraform changes.
- Decide and implement the Terraform state backend and safe state locking.
- Review subnet discovery tags, cluster creator permissions, and configurable node instance types.
- Complete setup, architecture, security, and teardown documentation.
- Run a plan and verify any real AWS deployment and workflow results before describing them as working.

## Requirements

- Terraform CLI compatible with the `required_version` in `src/providers.tf`.
- An AWS account and AWS CLI credentials configured outside this repository.
- AWS permissions to create VPC, EKS, IAM, and related resources.

## Local setup

1. Copy `src/terraform.tfvars.example` to `src/terraform.tfvars` and fill in the desired environment values.
2. Configure AWS credentials with the AWS CLI or environment-based credential chain. Do not put access keys in `.tfvars` or commit them.
3. Run Terraform from `src`:

   ```powershell
   terraform init
   terraform validate
   terraform plan
   ```

4. Review the plan and expected AWS costs carefully. Apply and destroy procedures are intentionally not automated in this incomplete version.

The current configuration does not define a remote backend, so Terraform will use local state by default. Never commit state files. A remote backend and locking must be designed before team use or automated applies.

## Repository safety

`.gitignore` excludes Terraform state, variable files, plans, local credentials, downloaded modules/providers, and the local clone of the upstream reference. The lockfile is tracked to record provider selections. Use the example variable file as a template; keep the real `terraform.tfvars` private.

## Reference

- [Original challenge repository](https://github.com/KubeDev/live-desafio-tech-01)
- [Walkthrough video](https://www.youtube.com/watch?v=OhV-pXgeVq4)
