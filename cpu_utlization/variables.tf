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

variable "alarm_threshold" {
  type = number
  default = 80
  description = "value for the threshold for the alarm"
}
  
variable "alarm_evaluation_periods" {
  type = number
  default = 2
  description = "value for the evaluation periods for the alarm"
}

variable "alarm_period" {
  type = number
  default = 120
  description = "value for the period for the alarm"
}

variable "environment" {
  type = string
  default = "dev"
  description = "value for the environment"
}