# FortiGate Terraform based lab on the Azure

## Introduction
This is a quick terraform based FortiGate LAB, consisted of a FortiGate GW and a Windows 10 VM behind it (you can access it directly through RDP), everything is terraform based including the initial firewall policy to provide you access.

## Requirements

* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider AzureRM >= 2.38.0
* Terraform Provider Template >= 2.2.2
* Terraform Provider Random >= 3.0.0
* if you use https://shell.azure.com you don't need to bother with the above


## Prerequisites
 - Access to https://shell.azure.com
 - The Resource Group name used "is terraform-fortigate-lab", you can change it in the main.tf
 - Contributor role in your azure subscription in order to run the createserviceprincipal.sh. it will output the relevant variables that you need to change in the terraform.tfvars. Have in mind that the appName is "ServicePrincipalDemo1", and it is unique across subscription, you can always modify the script.
 
## Deployment overview

Terraform deploys the following components:

* Azure Virtual Network with 2 subnets
* One FortiGate-VM instances with 2 NICs
* One Windows 10 Workstation
* The relevant rules for accessing the VM 
 
## Deployment

To deploy the LAB to Azure:

1. Clone the repository.
2. Customize variables in the `terraform.tfvars.example` and `variables.tf` file as needed.  And rename `terraform.tfvars.example` to `terraform.tfvars`.
3. Initialize the providers and modules:

   ```sh
   cd XXXXX
   terraform init
    ```

4. Submit the Terraform plan:

   ```sh
   terraform plan
   ```

5. Verify output.
6. Confirm and apply the plan:

   ```sh
   terraform apply
   ```

7. If output is satisfactory, type `yes`.

Output will include the information necessary to log in to the FortiGate-VM instances (and the Windows 10 VM, just RDP to the same ip as the fortigate device, same username/pass):

```sh
FGTPublicIP = <FGT Public IP>
Password = <FGT Password>
ResourceGroup = <Resource Group>
Username = <FGT Username>
```

## Destroy the lab

To destroy the lab, use the command:

```sh
terraform destroy
```

