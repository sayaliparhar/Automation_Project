resource "aws_instance" "jenkins" {
    ami = "ami-0a4bde39e76a58b64"
    instance_type = "t2.medium"
    key_name = aws_key_pair.key.key_name
    subnet_id = var.public_sub_1
    vpc_security_group_ids = [var.jenkins_sg]
    associate_public_ip_address = true
    user_data = file("${path.module}/cluster-init-script/mysql.sh")
    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }
    tags = {
      Name = "Jenkins"
    }
}

resource "aws_instance" "docker" {
    ami = "ami-0287d160a56cd0497"
    instance_type = "t2.medium"
    key_name = aws_key_pair.key.key_name
    subnet_id = var.private_sub_1
    vpc_security_group_ids = [var.docker_sg]
    associate_public_ip_address = false
    root_block_device {
      volume_size = 15
      volume_type = "gp3"
    }
    tags = {
      Name = "Docker"
    }
}