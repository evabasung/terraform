# This code also to check if t3micro is available in said az same as below code
# Datasource

provider "aws" {
  region  = "us-east-1"
}

data "aws_ec2_instance_type_offerings" "my_ins_type1" {
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }
  filter {
    name   = "location"
    #values = ["us-east-1a"]
    values = ["us-east-1e"]
  }
  location_type = "availability-zone"
}


# Output
output "output_v1_1" {
  value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types      #instance_types is the attr of aws_ec2_instance_type_offerings
}

#********************************************************************8
# This code also to check if t3micro is available in said az same as above code

# Datasource
data "aws_ec2_instance_type_offerings" "my_ins_type1" {
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }
  filter {
    name   = "location"
    #values = ["us-east-1a"]
    values = ["us-east-1e"]    
  }
  location_type = "availability-zone"
}


# Output
output "instances-supported" {
 value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
}
