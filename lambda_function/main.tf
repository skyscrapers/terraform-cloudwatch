// Setup Cloudwatch alarms for linked Lambda function
// Send alerts to given SNS topics.

// Lambda: Invocation Errors
resource "aws_cloudwatch_metric_alarm" "streamalert_lambda_invocation_errors" {
  alarm_name          = "${var.lambda_function}_invocation_errors"
  alarm_description   = "The errors on ${var.lambda_function} are higher than ${var.lambda_invocation_error_threshold} for ${var.lambda_invocation_error_period}"
  namespace           = "AWS/Lambda"
  metric_name         = "Errors"
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.lambda_invocation_error_threshold
  evaluation_periods  = var.lambda_invocation_error_evaluation_periods
  period              = var.lambda_invocation_error_period
  treat_missing_data  = var.lambda_invocation_error_treat_missing_data

  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]

  dimensions = {
    FunctionName = var.lambda_function
  }
}

// Lambda: Throttles
resource "aws_cloudwatch_metric_alarm" "streamalert_lambda_throttles" {
  alarm_name          = "${var.lambda_function}_throttles"
  alarm_description   = "Lambda function ${var.lambda_function} is being throttled"
  namespace           = "AWS/Lambda"
  metric_name         = "Throttles"
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.lambda_throttle_error_threshold
  evaluation_periods  = var.lambda_throttle_error_evaluation_periods
  period              = var.lambda_throttle_error_period

  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]

  dimensions = {
    FunctionName = var.lambda_function
  }
}

// Lambda: IteratorAge
resource "aws_cloudwatch_metric_alarm" "streamalert_lambda_iterator_age" {
  alarm_name          = "${var.lambda_function}_iterator_age"
  alarm_description   = "Lambda High Iterator Age for ${var.lambda_function}"
  namespace           = "AWS/Lambda"
  metric_name         = "IteratorAge"
  statistic           = "Maximum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.lambda_iterator_age_error_threshold
  evaluation_periods  = var.lambda_iterator_age_error_evaluation_periods
  period              = var.lambda_iterator_age_error_period

  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]

  dimensions = {
    FunctionName = var.lambda_function
  }
}
