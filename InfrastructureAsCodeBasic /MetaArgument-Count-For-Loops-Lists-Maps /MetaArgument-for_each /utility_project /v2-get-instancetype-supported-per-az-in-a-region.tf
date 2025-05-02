# Check if that respective Instance Type is supported in that Specific Region in list of availability Zones
# Get the List of Availability Zones in a Particular region where that respective Instance Type is supported
#output result with map that key and value , eg us-east-1a = t3micro

# Datasource
data "aws_ec2_instance_type_offerings" "my_ins_type2" {
  for_each = toset([ "us-east-1a", "us-east-1b", "us-east-1e" ])  #
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }
  filter {
    name   = "location"
    values = [each.key]                     #use each key in for_each and iterate checking on us-east-1a", "us-east-1b", "us-east-1e"
  }
  location_type = "availability-zone"
}


#Output-1
# Important Note: Once for_each is set, its attributes must be accessed on specific instances
# this output does not display the key and value like az us-east-1b = t3micro
output "output_v2_1" {
  #value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
  value = toset([for t in data.aws_ec2_instance_type_offerings.my_ins_type2: t.instance_types])   
}
# toset function process ec2_instance_type_offerings output to set
#Output-2
# Create a Map with Key as Availability Zone and value as Instance Type supported
# Map display the key and value like az us-east-1b = t3micro in output
# The prefer output
output "output_v2_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type2: az => details.instance_types
  }
}
