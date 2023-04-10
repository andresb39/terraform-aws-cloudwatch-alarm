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

variable "tags" {
  type = map(string)
  default = {
    managed = "terraform"
    created_by = "myCloudDoor"
  }
  description = "value for the tags for the alarm"
}