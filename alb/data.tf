# data "aws_lb" "lb" {
#   count = length(var.lb_name)
#   name = var.lb_name[count.index]
# }

# data "aws_lb_target_group" "target" {
#   count = length(var.target_name)
#   name = var.target_name[count.index]
# }

# # output "lb" {
# #   value = data.aws_lb.lb
# # }

# # output "target" {
# #   value = data.aws_lb_target_group.target
# # }