# Terraform Output Values

# EC2 Instance Public IP   # it search for the output keyword in the terraform worksapce output file
output "instance_publicip" {  
  description = "EC2 Instance Public IP"
  value = aws_instance.myec2.public_ip # public_ip here is keyword it picks mapping from ec2 instance resource --> "aws_instance" "myec2"
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.myec2.public_dns
}
