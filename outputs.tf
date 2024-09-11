# outputs.tf

output "vcn_id" {
  value = oci_core_virtual_network.vcn.id
}

output "subnet_id" {
  value = oci_core_subnet.subnet.id
}

output "security_list_id" {
  value = oci_core_security_list.security_list.id
}

output "windows_vm_id" {
  value = oci_core_instance.windows_vm.id
}

# Output the public IP of the instance
output "instance_public_ip" {
  value = oci_core_instance.windows_vm.public_ip
}
