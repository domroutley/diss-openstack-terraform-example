# Declaring network items
resource "openstack_networking_router_v2" "router" {
  name                = "Example Router"
  admin_state_up      = "true"                                                  # Active or not?
  external_network_id = "79174dc9-35a3-455f-a4ea-008b56be7797"                  # This ID is for the Cardiff Uni external network
}

resource "openstack_networking_network_v2" "network" {
  name                = "Example Network"
  admin_state_up      = "true"                                                  # Active or not?
}

resource "openstack_networking_subnet_v2" "subnet" {
  name                = "Example Subnet"
  network_id          = "${openstack_networking_network_v2.network.id}"         # The specific network to add this subnet to
  cidr                = "${var.subnet_CIDR}"
  ip_version          = "4"
  dns_nameservers     = ["10.239.40.2", "10.239.40.130"]                        # These are the Cardiff University DNS addresses
}

resource "openstack_networking_router_interface_v2" "router_internal_interface" { # Connect the router to the subnet
  router_id           = "${openstack_networking_router_v2.router.id}"           # What router
  subnet_id           = "${openstack_networking_subnet_v2.subnet.id}"           # What subnet
}

resource "openstack_networking_floatingip_v2" "floating_ip" {                   # Create a floating IP
  description = "Example Server IP"
  pool        = "cscloud_private_floating"                                      # What pool do we get the IP from
}
