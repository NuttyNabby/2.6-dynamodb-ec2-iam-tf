resource "aws_instance" "nabilah_dynamodb_reader" {
  ami                         = "ami-085ad6ae776d8f09c"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0d61f850a48e92e1a3"
  vpc_security_group_ids      = [aws_security_group.dynamodb_reader_sg.id]
  key_name                    = "nabilahkeypair"
  iam_instance_profile        = aws_iam_instance_profile.nabilah_dynamodb_read_profile.name
  associate_public_ip_address = true

  tags = {
    Name = "nabilah_dynamodb_reader"
  }
}
