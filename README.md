# Terraform Cloud Intro & Testing 

### What is Terraform Cloud 

Terraform Cloud is an application that helps teams use Terraform together. It manages Terraform runs in a consistent and reliable environment, and includes easy access to shared state and secret data, access controls for approving changes to infrastructure, a private registry for sharing Terraform modules, detailed policy controls for governing the contents of Terraform configurations, and more.

Terraform Cloud is available as a hosted service at https://app.terraform.io. Small teams can sign up for free to connect Terraform to version control, share variables, run Terraform in a stable remote environment, and securely store remote state. Paid tiers allow you to add more than five users, create teams with different levels of permissions, enforce policies before creating infrastructure, and collaborate more effectively.

Documentation:  
 - [terraform.io/docs/cloud](https://developer.hashicorp.com/terraform/cloud-docs)
 - [Run-Tasks](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/settings/run-tasks)
 - [Learning TFC](https://hashicorp.github.io/field-workshops-terraform/slides/azure/terraform-cloud/)
 - https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-remote

<br/>

##### Terraform

<p align="center">
  <img src="tf.png">
</p>
<br/>

##### Terraform Cloud

<p align="center">
  <img src="tfc.png">
</p>
<br/>

### Integrate with AWS

##### Setting up Terraform Cloud for AWS

Set Terraform Cloud environment variables either at the organization level:  
https://app.terraform.io/app/ccs-testing/settings/varsets

or at the workspace level:  
https://app.terraform.io/app/ccs-testing/workspaces/tfc-testing/variables

Add Workspace variables: 
- Select Environment variable
- For each variable, enter the `Key` and the `Value`
- Select `Sensitive` for any sensitive data or password


Key	| Value
------- | -------------
| `AWS_ACCESS_KEY_ID` | `AKIAIOSFODNN7EXAMPLE` |
| `AWS_SECRET_ACCESS_KEY` | `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY` (sensitive data) |
| `AWS_DEFAULT_REGION` | `us-west-2` |


See [Terraform docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#environment-variables) for more details

<br/>


To verify that your Azure integration, create a new resource in AWS.

Create a new TF file `aws-s3.tf`
```hcl
resource "aws_s3_bucket" "tfc-testing-cli-s3" {
  bucket = "tfc-testing-cli-s3"
}
```

Run Terraform Plan in Terraform Cloud
```console
terraform plan
```

<details><summary>CLI Output</summary>
<p>

```console
Running plan in Terraform Cloud. Output will stream here. Pressing Ctrl-C
will stop streaming the logs, but will not stop the plan running remotely.

Preparing the remote plan...

To view this run in a browser, visit:
https://app.terraform.io/app/ccs-testing/tfc-testing/runs/run-cud8uG1mYSLGcmyo

Waiting for the plan to start...

Terraform v1.3.6
on linux_amd64
Initializing plugins and modules...

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.tfc-testing-cli-s3 will be created
  + resource "aws_s3_bucket" "tfc-testing-cli-s3" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "tfc-testing-cli-s3"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.


------------------------------------------------------------------------

Cost Estimation:

Resources: 0 of 0 estimated
           $0.0/mo +$0.0
```

</p>
</details>

<br/>

Run Terraform Apply in Terraform Cloud
```console
terraform apply
```

<details><summary>CLI Output</summary>
<p>

```console
Running apply in Terraform Cloud. Output will stream here. Pressing Ctrl-C
will cancel the remote apply if it's still pending. If the apply started it
will stop streaming the logs, but will not stop the apply running remotely.

Preparing the remote apply...

To view this run in a browser, visit:
https://app.terraform.io/app/ccs-testing/tfc-testing/runs/run-gbzMAH5J38YyrWpe

Waiting for the plan to start...

Terraform v1.3.6
on linux_amd64
Initializing plugins and modules...

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.tfc-testing-cli-s3 will be created
  + resource "aws_s3_bucket" "tfc-testing-cli-s3" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "tfc-testing-cli-s3"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.


------------------------------------------------------------------------

Cost Estimation:

Resources: 0 of 0 estimated
           $0.0/mo +$0.0

------------------------------------------------------------------------

aws_s3_bucket.tfc-testing-cli-s3: Creation complete after 0s [id=tfc-testing-cli-s3]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

```

</p>
</details>

<br/>


Verify resources are deployed in Azure
```
aws s3 ls | grep tfc-testing-cli      
```

<details><summary>CLI Output</summary>
<p>

```console
2023-01-03 11:24:19 tfc-testing-cli-s3
```

</p>
</details>

<br/>


### Integrate with Azure

##### Creating an Azure Service Principal
To allow TFC access to Azure resources, create an Azure Service Principal.
[See Azure docs for more details](https://learn.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli)

Password-based authentication
```
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
```

Certificate-based authentication
(use the --create-cert parameter)
```
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --create-cert
```

Example:
```
az ad sp create-for-rbac --name "tplisson-Terraform-Cloud-SP" \
                         --role "Contributor" \
                         --scopes /subscriptions/d47f1af8-9795-4e86-bbce-da72cfd0f8ec \
                         --create-cert
```

<details><summary>CLI Output</summary>
<p>

```console
Creating 'Contributor' role assignment under scope '/subscriptions/d47f1af8-9795-4e86-bbce-da72cfd0f8ec'
The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
Please copy /Users/tplisson/tmp0uw8hlt0.pem to a safe place. When you run 'az login', provide the file path in the --password argument
AppId                                 DisplayName                  FileWithCertAndPrivateKey        Tenant
------------------------------------  ---------------------------  -------------------------------  ------------------------------------
f99e8f5f-8ad9-4c74-a854-5fd3463ba081  tplisson-Terraform-Cloud-SP  /Users/tplisson/tmp0uw8hlt0.pem  66b66353-3b76-4e41-9dc3-fee328bd400e
```

</p>
</details>

<br/>

Review existing Azure Service Principals: 
```
az ad sp list --show-mine 
```

<details><summary>CLI Output</summary>
<p>

```
az ad sp list --show-mine
This command or command group has been migrated to Microsoft Graph API. Please carefully review all breaking changes introduced during this migration: https://docs.microsoft.com/cli/azure/microsoft-graph-migration
DisplayName                                 Id                                    AppId                                 CreatedDateTime
------------------------------------------  ------------------------------------  ------------------------------------  --------------------
tplisson-Terraform-Cloud-SP                 36dc0c91-194c-4141-ab85-086c9583b19b  f99e8f5f-8ad9-4c74-a854-5fd3463ba081  2023-01-03T14:58:28Z
```

</p>
</details>

<br/>

##### Setting up Terraform Cloud for Azure

Set Terraform Cloud environment variables either at the organization level:
https://app.terraform.io/app/ccs-testing/settings/varsets

or at the workspace level:
https://app.terraform.io/app/ccs-testing/workspaces/tfc-testing/variables

Add Workspace variables: 
- Select Environment variable
- For each variable, enter the `Key` and the `Value`
- Select `Sensitive` for any sensitive data or password


For password-based authentication to Azure:

Key	| Value
------- | -------------
| `ARM_CLIENT_ID` | `00000000-0000-0000-0000-000000000000` |
| `ARM_SUBSCRIPTION_ID` | `00000000-0000-0000-0000-000000000000` |
| `ARM_TENANT_ID` | `00000000-0000-0000-0000-000000000000` |
| `ARM_CLIENT_SECRET` | `<your-secret-here>` (sensitive data) |


For certificate-based authentication to Azure:

Key	| Value
------- | -------------
| `ARM_CLIENT_ID` | `00000000-0000-0000-0000-000000000000` |
| `ARM_SUBSCRIPTION_ID` | `00000000-0000-0000-0000-000000000000` |
| `ARM_TENANT_ID` | `00000000-0000-0000-0000-000000000000` |
| `ARM_CLIENT_CERTIFICATE_PASSWORD` | `<your-password-here>` (sensitive data) |


[See Terraform docs for more details](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#argument-reference)


To verify that your Azure integration, create a new resource in Azure.

Create a new TF file `azr-rg.tf`:
```hcl
resource "azurerm_resource_group" "tfc-testing-cli-rg" {
  name     = "tfctestingclirg"
  location = "East US"
}
```

Run Terraform Plan in Terraform Cloud
```console
terraform plan
```

<details><summary>CLI Output</summary>
<p>

```console

```

</p>
</details>

<br/>

Run Terraform Apply in Terraform Cloud
```console
terraform apply
```

<details><summary>CLI Output</summary>
<p>

```console

```

</p>
</details>

<br/>


Verify resources are deployed in Azure
```
az group list | grep tfc-testing-cli-rg
```

<details><summary>CLI Output</summary>
<p>

```console

```

</p>
</details>

<br/>


### Integrate with GCP

<br/>

### Integrate with Prisma Cloud Code Security

<br/>

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
      name = "tfc-testing"
    }
  }
  required_version = ">= 1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<= 3.36.0"
    }
  }
}
```

Initializing Terraform Cloud
```
terraform init
```

<details><summary>CLI Output</summary>
<p>

```console
Initializing Terraform Cloud...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 3.28.0"...
- Finding hashicorp/azurerm versions matching "<= 3.36.0"...
- Using hashicorp/aws v3.28.0 from the shared cache directory
- Using hashicorp/azurerm v3.36.0 from the shared cache directory

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

╷
│ Warning: Incomplete lock file information for providers
│ 
│ Due to your customized provider installation methods, Terraform was forced to calculate lock file checksums locally for the following providers:
│   - hashicorp/aws
│   - hashicorp/azurerm
│ 
│ The current .terraform.lock.hcl file only includes checksums for darwin_amd64, so Terraform running on another platform will fail to install these providers.
│ 
│ To calculate additional checksums for another platform, run:
│   terraform providers lock -platform=linux_amd64
│ (where linux_amd64 is the platform to generate)
╵

Terraform Cloud has been successfully initialized!

You may now begin working with Terraform Cloud. Try running "terraform plan" to
see any changes that are required for your infrastructure.

If you ever set or change modules or Terraform Settings, run "terraform init"
again to reinitialize your working directory.
```

</p>
</details>

<br/>


Applying
```
terraform apply
```

<details><summary>CLI Output</summary>
<p>

```console

```

</p>
</details>

<br/>


### Using VCS-Driven Workflow
https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-vcs-change

### Using API-Driven Workflow

### Integrate with Prisma Cloud Code Security
