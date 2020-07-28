# infrastructure-as-code

## Packer

```bash
packer validate ubuntu-xenial.json

packer build -var-file="vars.json" amazon.json
```

## Terraform

```bash
terraform init

terraform plan -var-file="config/dev.tfvars"

terraform apply -var-file="config/dev.tfvars"
```
