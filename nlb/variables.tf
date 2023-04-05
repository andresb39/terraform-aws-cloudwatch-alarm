variable "sns-topic-name" {
  type = string
  default = "mcd-topic-monitoring"
  description = "value for the name of the sns topic"
}

variable "email_targets" {
  type = list(string)
  default = ["jesusandres.bergano@myclouddoor.com"]
  description = "value for the email target for the sns topic"
}

variable "lb_name" {
  type = list(string)
  default = ["us-east-1-pagares-produccion"]
  description = "value for the name of the alb"
}

variable "target_name" {
  type = list(string)
  default = ["tg-ext-web-services-1444", "tg-ext-web-services-1445", "tg-ext-web-services-1446"]
  description = "value for the name of the target group"
}

variable "alarm_threshold" {
  type = number
  default = 2
  description = "value for the threshold for the alarm"
}

# variable "alarm_evaluation_periods" {
#   type = number
#   default = 2
#   description = "value for the evaluation periods for the alarm"
# }

# variable "alarm_period" {
#   type = number
#   default = 120
#   description = "value for the period for the alarm"
# }

# variable "environment" {
#   type = string
#   default = "dev"
#   description = "value for the environment"
# }