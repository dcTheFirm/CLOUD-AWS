# EC2 Instance with SSH Access
resource "aws_instance" "web_server_ssh" {
  ami           = "ami-06fa3f12191aa3337" 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  iam_instance_profile = aws_iam_instance_profile.web_profile.name
  
  # SSH Key Pair
  key_name      = "terraform-ssh-key" 
  
  tags = {
    Name = "web-server-ssh-test"
  }

  # Automatic setup
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              # AWS CLI already installed in Amazon Linux 2
              echo "EC2 ready for SSH testing!" > /home/ec2-user/ready.txt
              EOF
}

# Output Public IP for SSH
output "ssh_public_ip" {
  value = aws_instance.web_server_ssh.public_ip
}

output "ssh_instance_id" {
  value = aws_instance.web_server_ssh.id
}
