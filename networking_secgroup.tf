resource "openstack_networking_secgroup_v2" "sec_group" {                       # Create a security group
  name        = "Example security group"
  description = "This security group allows SSH connections to its connected instances."
}

resource "openstack_networking_secgroup_rule_v2" "sec_grp_rule_ssh" {           # Create a rule (each group can (and usually should) have mutliple rules)
  description       = "SSH from everywhere"
  direction         = "ingress"                                                 # ingress is coming, egress is going
  ethertype         = "IPv4"                                                    # IPv4 or IPv6
  protocol          = "tcp"                                                     # What protocol to use
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"                                               # This is a CIDR, 0.0.0.0/0 validates to any address (i.e any address is allowed to access using this rule)
  security_group_id = "${openstack_networking_secgroup_v2.sec_group.id}"        # What group should this rule be assigned to
}
