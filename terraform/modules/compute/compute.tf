
resource "aws_instance" "instance" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_pub_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  user_data              = var.instance_user_data
  key_name               = var.instance_key_name
}

# RESOURCE: EC2 LAUNCH TEMPLATE

data "template_file" "user_data" {
    template = "${file("./modules/compute/scripts/user_data.sh")}"
    vars = {
        access_key_id     = "${var.access_key_id}"
        secret_access_key = "${var.secret_access_key}"
        session_token     = "${var.session_token}"
    }
}

resource "aws_launch_template" "ec2_lt" {
    name                   = "${var.ec2_lt_name}"
    image_id               = "${var.ec2_lt_ami}"
    instance_type          = "${var.ec2_lt_instance_type}"
    user_data              = "${base64encode(data.template_file.user_data.rendered)}"
    vpc_security_group_ids = ["${var.vpc_sg_pub_id}"]
}