// Setup Cloudwatch alarms for passed API gateway
// Send alerts to given SNS topics.

resource "aws_cloudwatch_metric_alarm" "ApiGateway_5XXError" {
  alarm_name          = "${var.api_gateway}_5XXError"
  alarm_description   = "The errors on ${var.api_gateway} are higher than ${var.5XXError_threshold} for ${var.5XXError_period}"
  namespace           = "AWS/ApiGateway"
  metric_name         = "5XXError"
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "${var.5XXError_threshold}"
  evaluation_periods  = "${var.5XXError_evaluation_periods}"
  period              = "${var.5XXError_period}"

  alarm_actions = ["${var.sns_topic_arn}"]
  ok_actions    = ["${var.sns_topic_arn}"]

  dimensions {
    FunctionName = "${var.api_gateway}"
  }
}

resource "aws_cloudwatch_metric_alarm" "ApiGateway_latency" {
  alarm_name          = "${var.api_gateway}_latency"
  alarm_description   = "The latency on ${var.api_gateway} is higher than ${var.latency_threshold} for ${var.latency_period}"
  namespace           = "AWS/ApiGateway"
  metric_name         = "Latency"
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "${var.latency_threshold}"
  evaluation_periods  = "${var.latency_evaluation_periods}"
  period              = "${var.latency_period}"

  alarm_actions = ["${var.sns_topic_arn}"]
  ok_actions    = ["${var.sns_topic_arn}"]

  dimensions {
    FunctionName = "${var.api_gateway}"
  }
}

resource "aws_cloudwatch_metric_alarm" "ApiGateway_integrationlatency" {
  alarm_name          = "${var.api_gateway}_integrationlatency"
  alarm_description   = "The latency on ${var.api_gateway} is higher than ${var.integrationlatency_threshold} for ${var.integrationlatency_period}"
  namespace           = "AWS/ApiGateway"
  metric_name         = "IntegrationLatency"
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "${var.integrationlatency_threshold}"
  evaluation_periods  = "${var.integrationlatency_evaluation_periods}"
  period              = "${var.integrationlatency_period}"

  alarm_actions = ["${var.sns_topic_arn}"]
  ok_actions    = ["${var.sns_topic_arn}"]

  dimensions {
    FunctionName = "${var.api_gateway}"
  }
}
