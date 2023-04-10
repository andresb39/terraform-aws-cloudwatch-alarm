resource "aws_sns_topic" "topic" {
	# checkov:skip=CKV_AWS_26: ADD REASON
  name = var.sns-topic-name
  tags = var.tags
}

resource "aws_sns_topic_subscription" "email_subscription" {
  count = length(var.email_targets)
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = var.email_targets[count.index]
}
