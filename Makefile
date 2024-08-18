.PHONY: help

tf-init:
	@terraform init

tf-plan:
	@terraform plan

tf-apply:
	@terraform apply --var-file=terraform.tfvars --auto-approve

tf-destroy:
	@terraform destroy --var-file=terraform.tfvars --auto-approve

tf-nuke:
	$(MAKE) tf-destroy
	$(MAKE) tf-apply

tf-test-run:
	$(MAKE) tf-apply
	$(MAKE) tf-destroy
