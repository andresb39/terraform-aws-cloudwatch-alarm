# resource "aws_cloudwatch_metric_alarm" "alb_health_check" {
#   count = length(var.target_name)
#   alarm_name          = "alb-health-check-${var.target_name[count.index]}"
#   comparison_operator = "LessThanThreshold"
#   evaluation_periods  = 1
#   metric_name         = var.metric_name
#   namespace           = "AWS/ApplicationELB"
#   period              = 60
#   statistic           = "Average"
#   threshold           = var.alarm_threshold
#   alarm_description   = "Number of healthy nodes in Target Group"
#   actions_enabled     = true
#   alarm_actions       = [aws_sns_topic.topic.arn]
#   ok_actions          = [aws_sns_topic.topic.arn]
#   dimensions = {
#     MetricName  = data.aws_lb_target_group.target[count.index].arn_suffix
#     LoadBalancer = data.aws_lb.lb[0].arn_suffix
#   }
# }

resource "aws_cloudwatch_metric_alarm" "alb_health_check" {
  alarm_name                = "terraform-test-foobar"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  threshold                 = 10
  alarm_description         = "Request error rate has exceeded 10%"
  insufficient_data_actions = []

  metric_query {
    id          = "e1"
    expression  = "m2/m1*100"
    label       = "Error Rate"
    return_data = "true"
  }

  metric_query {
    id = "m1"

    metric {
      metric_name = "RequestCount"
      namespace   = "AWS/ApplicationELB"
      period      = 60
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        LoadBalancer = "app/us-east-1-prod-a2censo-jasper/6fb01dd7e4539d73"
      }
    }
  }

  metric_query {
    id = "m2"

    metric {
      metric_name = "HTTPCode_Target_4XX_Count"
      namespace   = "AWS/ApplicationELB"
      period      = 60
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        LoadBalancer = "app/us-east-1-prod-a2censo-jasper/6fb01dd7e4539d73"
      }
    }
  }
}