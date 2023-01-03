# Terraform Cloud Intro & Testing 

### What is Terraform Cloud 

Terraform Cloud is an application that helps teams use Terraform together. It manages Terraform runs in a consistent and reliable environment, and includes easy access to shared state and secret data, access controls for approving changes to infrastructure, a private registry for sharing Terraform modules, detailed policy controls for governing the contents of Terraform configurations, and more.

Terraform Cloud is available as a hosted service at https://app.terraform.io. Small teams can sign up for free to connect Terraform to version control, share variables, run Terraform in a stable remote environment, and securely store remote state. Paid tiers allow you to add more than five users, create teams with different levels of permissions, enforce policies before creating infrastructure, and collaborate more effectively.

Documentation:  
[terraform.io/docs/cloud](https://developer.hashicorp.com/terraform/cloud-docs)

[Run-Tasks](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/settings/run-tasks)

[Learning TFC](https://hashicorp.github.io/field-workshops-terraform/slides/azure/terraform-cloud/)


### Integrate with AWS

### Integrate with Azure

Create an Azure Service Principal to allow TFC access to Azure resources:
```
az ad sp create-for-rbac --scopes /subscriptions/mySubscriptionID
```
Create a service principal for a resource group using a preferred name and role
```
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role reader \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/
```
To create a self-signed certificate for authentication, use the --create-cert parameter:
```
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --create-cert
```

Review existing Azure Service Principals: 
```
az ad sp list --show-mine 
```

### Integrate with GCP

### Integrate with Prisma Cloud Code Security


### Using CLI-Driven Workflow
/Users/tplisson/labs/tfc

Authentication
```cli
terraform login
```

TF init file
```hcl
terraform {
  cloud {
    organization = "ccs-testing"
    workspaces {
      name = "learn-terraform-cloud"
    }
  }
  required_version = ">= 1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }
  }
}
```

Initializing Terraform Cloud
```
terraform init
```

Applying
```
terraform apply
```


### Using VCS-Driven Workflow
https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-vcs-change

### Using API-Driven Workflow

### Integrate with Prisma Cloud Code Security
