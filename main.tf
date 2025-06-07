data "aws_availability_zones" "available" {}

data "aws_ssm_parameter" "amazonlinux_2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64" # x86_64
}

resource "aws_instance" "web" {
  ami           = data.aws_ssm_parameter.amazonlinux_2023.value
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}
