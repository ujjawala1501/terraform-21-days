resource "aws_instance" "app_server" {
  ami           = "ami-05fa46471b02db0ce" # id of the system youl be connected to ,this is region specific 
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
    Owner = "ujjawala"
  }
}