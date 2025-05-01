#resources ec2 instance
resource "aws_instance" "myec2" {
    ami = data.aws_ami.amzlinux2.id  # it pick id from datasource file --> data "aws_ami" "amzlinux2"
    instance_type = var.instance_type #picks value from var file variable "instance_type" var name
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.instance_keypair  #picking from variable file variable "instance_keypair"
    vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id   ]
    # pick sg info from the sg resource file ,"aws_security_group" "vpc-ssh
    tags = {
        "name" = "ec2 demo 2"
    }
}
