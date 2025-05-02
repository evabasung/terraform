# EC2 Instance Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  #value = aws_instance.myec2vm.*.public_ip   # Legacy Splat # will not work since it accept only list ouput
  #value = aws_instance.myec2vm[*].public_ip  # Latest Splat # will not work since it accept only list ouput
  value = [for instance in aws_instance.myec2vm: instance.public_ip]
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  #value = aws_instance.myec2vm[*].public_dns  # Legacy Splat
  #value = aws_instance.myec2vm[*].public_dns  # Latest Splat
  value = [for instance in aws_instance.myec2vm: instance.public_dns]


# # EC2 Instance Public DNS with TOSET Optional 
# output "instance_publicdns" {
#   description = "EC2 Instance Public DNS"
#   value = toset([for instance in aws_instance.myec2vm: instance.public_dns])
# }

# # EC2 Instance Public DNS with TOMAP
# output "instance_publicdns2" {
#   value = { for az, instance in aws_instance.myec2vm: az => instance.public_dns}
 }
