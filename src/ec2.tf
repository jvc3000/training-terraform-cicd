resource "aws_instance" "example" {
  ami = var.my-os-image
  instance_type = var.machine_size
  key_name = var.private_key_name
  # adding secutiry group to ec2 vm
  vpc_security_group_ids = [ aws_security_group.vince_sec_groups.id ]

  tags = {
    Name = var.vm_name
  }
}

resource "local_file" "public_ip" {
  filename = "${path.module}/myip.txt"
  content  = aws_instance.example.public_ip
}
