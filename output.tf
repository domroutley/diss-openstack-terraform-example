output "IP_Address" {
  value = "${openstack_networking_floatingip_v2.floating_ip.address}"
}