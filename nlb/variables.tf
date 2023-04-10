variable "sns-topic-arn" {
  type = string
  default = ""
  description = "value for the arn of the sns topic"
}

variable "lb_name" {
  type = list(string)
  default = ["us-east-1-pagares-produccion"]
  description = "value for the name of the alb"
}

variable "target_name" {
  type = list(string)
  default = []
  description = "value for the name of the target group"
}

variable "alarm_threshold" {
  type = number
  default = 2
  description = "value for the threshold for the alarm"
}

variable "alarm_evaluation_periods" {
  type = number
  default = 1
  description = "value for the evaluation periods for the alarm"
}

variable "alarm_period" {
  type = number
  default = 60
  description = "value for the period for the alarm"
}

variable "tags" {
  type = map(string)
  default = {
    managed = "terraform"
    created_by = "myCloudDoor"
  }
  description = "value for the tags for the alarm"
}