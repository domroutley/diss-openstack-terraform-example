variable "tenant_id" {
  description = "The id of the Tenant, this is unique to the user."
  default     = "3ff3ac12e9a044049079822d465840c9"
}

variable "auth_url" {
  description = "The endpoint url to connect to OpenStack."
  default     = "https://cscloud.cf.ac.uk:5000"
}

variable "token" {} # This variable needs to be "declared" but is stored as an environment variable

variable "subnet_CIDR" {
  description = "The CIDR for the example subnet."
  default     = "192.168.0.0/24"
}

variable "image" {
  description = "The image that will be used to create the instance."
  default     = "Ubuntu Server 18.04.1"
}

variable "flavour" {
  description = "The type of virtual server to create."
  default     = "m1.micro"
}

variable "key_name" {
  description = "The name of the key to put onto OpenStack."
  default     = "alohomora"
}

variable "access_key" {
  description = "Create a public-private keypair. Copy the PUBLIC key into this variable."
  default     = "PUBLIC KEY HERE"
}
