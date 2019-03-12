output "IP_Address" {
  value = "${openstack_networking_floatingip_v2.floating_ip.address}"           # This outputs the IP address of the server at the end of the Terraform run and when you run "Terraform output"
}
