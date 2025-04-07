
data "amazon-ami" "ubuntu-wordpress" {
  filters = {
    name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["099720109477"]
  region      = "eu-west-2"
  profile = "Nathan-Dev"
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "ubuntu-wordpress" {
  ami_name      = "wordpress-ami-example ${local.timestamp}"
  instance_type = "t2.micro"
  region        = "eu-west-2"
  profile = "Nathan-Dev"
  source_ami    = "${data.amazon-ami.ubuntu-wordpress.id}"
  ssh_username  = "ubuntu"
  tags = {
    Name  = "Wordpress"
    Value = "Wordpress-${local.timestamp}"
  }
}

build {
  sources = ["source.amazon-ebs.ubuntu-wordpress"]

  provisioner "shell" {
    script = "./wordpress-install.sh"
  }
}
