# Openstack Terraform Example

## Setup
1. Download/clone the repository into a new directory
1. Generate a token to access OpenStack and export it to your environment ([help here](TOKENGENERATIONHELP.md))
1. Make sure Terraform is installed on to your machine ([help here](learn.hashicorp.com/terraform/getting-started/install.html))
1. Run `terraform init` in the repository directory

## Running the module
1. Assuming everything went ok with the setup, create an SSH key and copy the Public key into the [variables](vars.tf) file as the default value of the variable "access_key"
1. You should now be all set. Run `terraform plan` to see the changed to be made to the cloud. `terraform plan` will also validate that your module is formed correctly and has no syntax errors.
1. If you are satisfied with what you see, run `terraform apply` and type and approve the changes.
1. You should be able to see the IP address of the instance as the output printed at the end of Terraforms run.
   - To bring this up again you can run `terraform output`
1. You can now SSH into the server with the following command `ssh -i LOCATION_OF_SSH_KEY ubuntu@INSTANCE_IP`
   - It may take a couple of minutes for the server to be able to accept SSH requests so be patient
   - If you are not on the university network, you will need to connect via the VPN before you can SSH into the instance.
   - [Using OpenVPN to connect to Cardiff Uni VPN Windows](https://docs.cs.cf.ac.uk/notes/openvpn-windows/)
   - [Using OpenVPN to connect to Cardiff Uni VPN MacOS](https://docs.cs.cf.ac.uk/notes/openvpn-macos/)
   - For Linux, get the ovpn file from one of the above links, then add a new connection in your network manager from the ovpn template file.
