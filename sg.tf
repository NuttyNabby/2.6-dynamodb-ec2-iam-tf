# Define the security group
resource "aws_security_group" "dynamodb_reader_sg" {
  name        = "dynamodb_reader_sg"
  description = "Security group for DynamoDB Reader"
  vpc_id      = "vpc-01b1d7418d6facfe5"

  ingress {
    description = "Allow SSH from your IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow HTTPS outbound"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

