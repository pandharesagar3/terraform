output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets[*].id
}

output "public_instance_ids" {
  value = aws_instance.public_instances[*].id
}

output "private_instance_ids" {
  value = aws_instance.private_instance.id
}


output "access_key_id" {
  value = aws_iam_access_key.my_user_access_key.id
}

output "secret_access_key" {
  value = aws_iam_access_key.my_user_access_key.secret
  sensitive = true
}
