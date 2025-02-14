
output "instance_id" {
  value = aws_instance.nabilah_dynamodb_reader.id
}

output "public_ip" {
  value = aws_instance.nabilah_dynamodb_reader.public_ip
}

data "aws_instances" "running_instances" {
  instance_state_names = ["running"]
}
output "instance_public_ips" {
  value = data.aws_instances.running_instances.public_ips
}
