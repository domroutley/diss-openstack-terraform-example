resource "openstack_compute_instance_v2" "server" {                             # Create an instance
  image_name      = "${var.image}"                                              # The name of the image that is to be used
  flavor_name     = "${var.flavour}"                                            # The flavor of server to use
  name            = "Example Server"                                            # The unique name for this instance
  key_pair        = "${openstack_compute_keypair_v2.my_key.name}"               # What ssh key pair to use
  security_groups = ["${openstack_networking_secgroup_v2.sec_group.name}"]      # What security group/s are associated with instance
  network {                                                                     # Select what network/s to assign instance to
    name = "${openstack_networking_network_v2.network.name}"                    # The name of the network to connect the instance to
  }
}

resource "openstack_compute_floatingip_associate_v2" "ip_assoc" {               # Associate the floating IP with the instance
  floating_ip = "${openstack_networking_floatingip_v2.floating_ip.address}"     # What floating IP
  instance_id = "${openstack_compute_instance_v2.server.id}"                    # What instance
}

resource "openstack_compute_keypair_v2" "my_key" {                              # Create a keypair on OpenStack
  name       = "${var.key_name}"                                                # What is the name of the key
  public_key = "${var.access_key}"                                              # What is the public key
}
