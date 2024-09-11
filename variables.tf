# variables.tf

variable "tenancy_ocid" {
  description = "The OCID of the tenancy"
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user"
  type        = string
}

variable "fingerprint" {
  description = "The fingerprint for the API key"
  type        = string
}

variable "private_key_path" {
  description = "The path to the private key file"
  type        = string
}

variable "region" {
  description = "The OCI region"
  type        = string
}

variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "vcn_cidr_block" {
  description = "The CIDR block for the VCN"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_domain" {
  description = "The availability domain for the resources"
  type        = string
}

variable "vm_shape" {
  description = "The shape of the virtual machine"
  type        = string
}

variable "image_id" {
  description = "The OCID of the image to use for the VM"
  type        = string
}

variable "rdp_allowed_cidr" {
  description = "The CIDR block from which RDP access is allowed"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key file"
  type        = string
}

variable "internet_gateway_display_name" {
  description = "The display name for the Internet Gateway"
  type        = string
  default     = "my-internet-gateway"
}

variable "route_table_display_name" {
  description = "The display name for the Route Table"
  type        = string
  default     = "my-route-table"
}

