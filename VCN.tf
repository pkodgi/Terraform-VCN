# Source from https://registry.terraform.io/modules/oracle-terraform-modules/vcn/oci/

module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "2.0.0"
  # insert the 4 required variables here
  compartment_id=var.compartment_id
  vcn_name="TerraformVCN"
  vcn_dns_label="VCNPradyDNS"
  vcn_cidr="10.0.0.0/16"
  region=var.region
  internet_gateway_enabled = true
  nat_gateway_enabled = true
  service_gateway_enabled = true
}
data "oci_identity_availability_domain" "test_compartment" {
    #Required
    compartment_id = var.tenancy_ocid
  ad_number="1"
}


