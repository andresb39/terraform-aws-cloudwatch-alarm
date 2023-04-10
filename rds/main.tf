data "aws_db_instance" "database" {
  db_instance_identifier = "us-east-1-prod-db-aurora-postgres"
}

module "aws-rds-alarms" {
  source         = "lorenzoaiello/rds-alarms/aws"
  version        = "v2.2.0"
  db_instance_id = data.aws_db_instance.database.id
  db_instance_class = data.aws_db_instance.database.db_instance_class
  cpu_utilization_too_high_threshold = 80
  tags = {
    managed = "terraform"
    created_by = "myCloudDoor"
  }
}