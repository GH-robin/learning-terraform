output "instance_ami" {
  value = aws_instance.web.ami
  sensitive = true
}

output "instance_arn" {
  value = aws_instance.web.arn
  sensitive = true
}
