variable "compartment_id" {
  default = "ocid1.compartment.oc1..aaaaaaaaldrjz3hdkuetjpg773h7chicnahfhlwcfluoeigw3w6lurqlyt5q"
}
resource "oci_core_vcn" "test_vcn" {
compartment_id = var.compartment_id
display_name = "PradyTFJenkins"
cidr_block = "10.0.0.0/16"
dns_label = "pradyDNS"
}

