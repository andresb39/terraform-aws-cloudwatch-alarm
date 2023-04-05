resource "aws_cloudwatch_metric_alarm" "cpu_util_alarm" {
  for_each = { for i, instance in data.aws_instances.instances.ids : instance => i }
  alarm_name          = "CPUUtilization-${each.key}-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.alarm_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.alarm_period
  statistic           = "Average"
  threshold           = var.alarm_threshold
  alarm_description   = "This metric monitors EC2 CPU utilization"
  dimensions          = { InstanceId = each.key }
  alarm_actions       = [aws_sns_topic.topic.arn]
  tags = {
    environment = var.environment
    Terraform = true
  }
}
