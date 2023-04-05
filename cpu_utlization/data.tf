data "aws_instances" "instances" {
  instance_state_names = ["running"]
}