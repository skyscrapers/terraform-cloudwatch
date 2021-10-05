output "lambda_invocation_errors_cloudwatch_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.streamalert_lambda_invocation_errors.arn
}

output "lambda_throttles_cloudwatch_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.streamalert_lambda_throttles.arn
}

output "lambda_iterator_age_cloudwatch_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.streamalert_lambda_iterator_age.arn
}
