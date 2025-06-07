data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"
  vpc_security_group_ids = ["sg-06df8e333ca024baa"]
  subnet_id = "subnet-092f375e98bd844de","subnet-0e53e38fb9c27001e","subnet-0b30aeadd44c64dad"

  tags = {
    Name = "HelloWorld"
  }
}
