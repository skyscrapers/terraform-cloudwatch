// Dynamo requests are being throttled.
resource "aws_cloudwatch_metric_alarm" "dynamo_table_throttles" {
  alarm_name          = "${var.dynamodb_table_name}_throttles"
  alarm_description   = "Requests are being throttled to the ${var.dynamodb_table_name} table"
  namespace           = "AWS/DynamoDB"
  metric_name         = "ThrottledRequests"
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.dynamodb_throttle_threshold
  period              = var.dynamodb_throttle_period
  evaluation_periods  = var.dynamodb_throttle_evaluation_periods

  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]

  dimensions = {
    TableName = var.dynamodb_table_name
  }
}

