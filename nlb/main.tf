resource "aws_cloudwatch_metric_alarm" "nlb_healthyhosts" {
  count = length(var.target_name)
  alarm_name          = "nlb-healthyhosts-${var.target_name[count.index]}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.alarm_evaluation_periods
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/NetworkELB"
  period              = var.alarm_period
  statistic           = "Average"
  threshold           = var.alarm_threshold
  alarm_description   = "Number of healthy nodes in Target Group"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.topic.arn]
  ok_actions          = [aws_sns_topic.topic.arn]
  dimensions = {
    TargetGroup  = data.aws_lb_target_group.target[count.index].arn_suffix
    LoadBalancer = data.aws_lb.lb[0].arn_suffix
  }
  tags = var.tags
}
