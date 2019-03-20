// Kinesis: Iterator Age
resource "aws_cloudwatch_metric_alarm" "_kinesis_iterator_age" {
  alarm_name          = "${var.kinesis_stream_name}_high_iterator_age"
  alarm_description   = "The Get iterator age of ${var.kinesis_stream_name} is starting to lag behind"
  namespace           = "AWS/Kinesis"
  metric_name         = "GetRecords.IteratorAgeMilliseconds"
  statistic           = "Maximum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "${var.kinesis_iterator_age_error_threshold}"
  evaluation_periods  = "${var.kinesis_iterator_age_error_evaluation_periods}"
  period              = "${var.kinesis_iterator_age_error_period}"
  alarm_description   = " Kinesis High Iterator Age: ${var.kinesis_stream_name}"

  alarm_actions             = ["${var.sns_topic_arn}"]
  ok_actions                = ["${var.sns_topic_arn}"]
  insufficient_data_actions = ["${var.sns_topic_arn}"]

  dimensions {
    StreamName = "${var.kinesis_stream_name}"
  }
}

// Kinesis: Write Throughput Exceeded
resource "aws_cloudwatch_metric_alarm" "_kinesis_write_exceeded" {
  alarm_name          = "${var.kinesis_stream_name}_write_exceeded"
  alarm_description   = "There are more writes going into ${var.kinesis_stream_name} than the chards can handle"
  namespace           = "AWS/Kinesis"
  metric_name         = "WriteProvisionedThroughputExceeded"
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "${var.kinesis_write_throughput_exceeded_threshold}"
  evaluation_periods  = "${var.kinesis_write_throughput_exceeded_evaluation_periods}"
  period              = "${var.kinesis_write_throughput_exceeded_period}"
  alarm_description   = " Kinesis Write Throughput Exceeded: ${var.kinesis_stream_name}"

  alarm_actions             = ["${var.sns_topic_arn}"]
  ok_actions                = ["${var.sns_topic_arn}"]
  insufficient_data_actions = ["${var.sns_topic_arn}"]

  dimensions {
    StreamName = "${var.kinesis_stream_name}"
  }
}
