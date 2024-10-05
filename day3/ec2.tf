 resource "aws_instance" "prod" {
  ami = "ami-09da212cf18033880"
  instance_type = "t2.micro"
  key_name = "my_keyyyy"
  subnet_id = aws_subnet.cust.id
  vpc_security_group_ids = [aws_security_group.allows_tls.id]

}