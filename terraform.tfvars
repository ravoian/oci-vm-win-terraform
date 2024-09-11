# terraform.tfvars
tenancy_ocid         = "<your_tenancy_ocid>"
user_ocid            = "<your_user_ocid>"
fingerprint          = "<your_fingerprint>"
private_key_path     = "~/.oci/oci-api-key.pem"
region               = "<your_region>"

compartment_id       = "<your_compartment_id>"
availability_domain  = "<your_availability_domain>"
image_id             = "ocid1.image.oc1.us-sanjose-1.aaaaaaaatyh3i2msy62sibkrvywo5zfiopu4y7gli6ssudm76fupkvm5p2iq" #Windows Server 2022 Standard Edition
ssh_public_key       = "~/.ssh/id_rsa.pub"

vcn_cidr_block       = "10.0.0.0/16"
subnet_cidr_block    = "10.0.1.0/24"
vm_shape             = "VM.Standard.E5.Flex"
rdp_allowed_cidr     = "0.0.0.0/0"
ssh_public_key_path  = "~/.ssh/id_rsa.pub"