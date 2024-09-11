# main.tf

resource "oci_core_virtual_network" "vcn" {
  compartment_id = var.compartment_id
  display_name    = "my-new-vcn"
  cidr_block      = var.vcn_cidr_block
  dns_label       = "myvcn"
}

resource "oci_core_subnet" "subnet" {
  compartment_id      = var.compartment_id
  vcn_id              = oci_core_virtual_network.vcn.id
  cidr_block          = var.subnet_cidr_block
  availability_domain = var.availability_domain
  display_name        = "my-new-subnet"
  dns_label           = "mysubnet"
  route_table_id      = oci_core_route_table.route_table.id

  # Associate with the security list
  security_list_ids = [oci_core_security_list.security_list.id]
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_id
  display_name    = var.internet_gateway_display_name
  vcn_id          = oci_core_virtual_network.vcn.id
}

resource "oci_core_route_table" "route_table" {
  compartment_id = var.compartment_id
  display_name    = var.route_table_display_name
  vcn_id          = oci_core_virtual_network.vcn.id

  route_rules {
    destination = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
}

resource "oci_core_security_list" "security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "my-new-security-list"

  ingress_security_rules {
    protocol    = "6"  # TCP
    source      = "0.0.0.0/0"
    tcp_options {
      min = 3389
      max = 3389
    }
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_instance" "windows_vm" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  shape               = var.vm_shape
  shape_config {
    memory_in_gbs = 12
    ocpus = 1
  }


  create_vnic_details {
    subnet_id         = oci_core_subnet.subnet.id
    assign_public_ip  = true
  }

  source_details {
    source_id   = var.image_id
    source_type = "image"
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
  }
}
