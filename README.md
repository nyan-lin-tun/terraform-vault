# Terraform with vault 

Sample project for terraform with vault integration

## How to test
- Open terminal
- Enter command `cd ~/path/to/project`
- Create `terraform.tfvars`, Enter command `touch terraform.tfvars`
- Paste vault server root token in `terraform.tfvars` as `dev_server1_token = "YOUR_VAULT_SERVER_ROOT_TOKEN"`
- Run command `terraform apply -auto-approve`