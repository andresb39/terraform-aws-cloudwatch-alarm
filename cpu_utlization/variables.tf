variable "sns-topic-arn" {
  type = string
  default = "mcd-topic-monitoring"
  description = "value for the arn of the sns topic"
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

variable "tags" {
  type = map(string)
  default = {
    managed = "terraform"
    created_by = "myCloudDoor"
  }
  description = "value for the tags for the alarm"
}