resource "aws_instance" "Arpanainstance1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.ssh.id]
  key_name               = var.key_name

  tags = {
    Name = "TerraformInstance1"
  }
}
variable "ami_id" {
  type    = string
  default = "ami-0cff7528ff583bf9a"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  default = "arpana028"
}

resource "aws_security_group" "ssh" {
  name   = "ssh_sg"
  vpc_id = "vpc-0ecd7b2ceb9c57f0c"

  ingress {
    description = "SSH From VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh_sg"
  }
}
