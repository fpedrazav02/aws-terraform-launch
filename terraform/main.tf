provider "aws" {
    region      = "us-east-1"
    access_key  = "AKIAVJ7K******"
    secret_key  = "1iNr***************"
}

resource "aws_security_group" "SecurityFwRules" {

    name = "secGroupOne"

    description = "Allow TLS inbound traffic"

    ingress {
        description = "SSH connection from VPC"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Http connection from VPC"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {

        name = "allow_tls"

    }
}


resource "aws_instance" "AWS-TERRA-LAUNCH" {
  ami           = "ami-0f409bae3775dc8e5"
  instance_type = "t2.micro"
  tags = {
    Name = "Project1"
  }
  key_name = "fpedrazavNewKPair"
  user_data = <<-EOF

      #!/bin/bash

        sudo yum install git -y

        sudo amazon-linux-extras install java-openjdk11 -y

  	    sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

         sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

        sudo yum install jenkins -y

        sudo systemctl start jenkins

        sudo yum install python -y

   EOF
}

resource "aws_network_interface_sg_attachment" "sg_attachment1" {
    security_group_id = aws_security_group.SecurityFwRules.id
    network_interface_id = aws_instance.AWS-TERRA-LAUNCH.primary_network_interface_id
}
