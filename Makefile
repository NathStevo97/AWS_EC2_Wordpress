.PHONY: help

help:
	@echo "Available commands:"
	@echo "  make packer-init       - Initialize Packer with required plugins"
	@echo "  make packer-build      - Build the Packer image for Ubuntu WordPress"
	@echo "  make tf-init           - Initialize Terraform"
	@echo "  make tf-plan           - Create a Terraform execution plan"
	@echo "  make tf-apply          - Apply the Terraform configuration"
	@echo "  make tf-destroy        - Destroy the Terraform-managed infrastructure"
	@echo "  make tf-nuke           - Destroy and re-apply the Terraform configuration"
	@echo "  make tf-test-run       - Run a test by applying and then destroying the infrastructure"

packer-init:
	@packer init ./packer/required_plugins.pkr.hcl

packer-build:
	@packer build -var-file=packer/variables.pkrvars.hcl ./packer/ubuntu-wordpress.pkr.hcl

tf-init:
	@terraform init

tf-plan:
	@terraform plan

tf-apply:
	@terraform apply --var-file=terraform.tfvars --auto-approve

tf-destroy:
	@terraform destroy --var-file=terraform.tfvars --auto-approve

tf-nuke: tf-destroy tf-apply

tf-test-run: tf-apply tf-destroy
