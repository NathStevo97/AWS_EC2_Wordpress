variable "region" {
  type    = string
  default = "us-east-1"
}

variable "aws_profile" {
  type    = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

data "amazon-ami" "ubuntu-wordpress" {
  filters = {
    name                = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["099720109477"]
  region      = var.region
  profile = var.aws_profile
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "ubuntu-wordpress" {
  ami_name      = "wordpress-ami-example ${local.timestamp}"
  instance_type = var.instance_type
  region        = var.region
  profile = "Nathan-Dev"
  source_ami    = "${data.amazon-ami.ubuntu-wordpress.id}"
  ssh_username  = var.ssh_username
  tags = {
    Name  = "Wordpress"
    Value = "Wordpress-${local.timestamp}"
  }
}

build {
  sources = ["source.amazon-ebs.ubuntu-wordpress"]

  provisioner "shell" {
    script = "./packer/wordpress-install.sh"
  }
}
