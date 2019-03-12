provider "openstack" {

  tenant_id     = "${var.tenant_id}"                       # The tenant is the user acount that is to be targeted
  auth_url      = "${var.auth_url}"                        # The auth_url is the url for Terraform to use to talk to OpenStack
  token         = "${var.token}"                           # Your access token
}
