locals {
  thresholds = {
    FreeStorageSpaceThreshold  = "${max(var.free_storage_space_threshold, 0)}"
    MinimumAvailableNodes      = "${max(var.min_available_nodes, 0)}"
    CPUUtilizationThreshold    = "${min(max(var.cpu_utilization_threshold, 0), 100)}"
    JVMMemoryPressureThreshold = "${min(max(var.jvm_memory_pressure_threshold, 0), 100)}"
  }
}

resource "aws_cloudwatch_metric_alarm" "cluster_status_is_red" {
  alarm_name          = "ElasticSearch-ClusterStatusIsRed-${var.elasticsearch_cluster_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ClusterStatus.red"
  namespace           = "AWS/ES"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "Average elasticsearch cluster status is in red over last 5 minutes"
  alarm_actions       = ["${var.sns_topic_arn}"]
  ok_actions          = ["${var.sns_topic_arn}"]
  treat_missing_data  = "ignore"

  dimensions {
    DomainName = "${var.elasticsearch_cluster_name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "cluster_status_is_yellow" {
  alarm_name          = "ElasticSearch-ClusterStatusIsYellow-${var.elasticsearch_cluster_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ClusterStatus.yellow"
  namespace           = "AWS/ES"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "Average elasticsearch cluster status is in yellow over last 5 minutes"
  alarm_actions       = ["${var.sns_topic_arn}"]
  ok_actions          = ["${var.sns_topic_arn}"]
  treat_missing_data  = "ignore"

  dimensions {
    DomainName = "${var.elasticsearch_cluster_name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "free_storage_space_too_low" {
  alarm_name          = "ElasticSearch-FreeStorageSpaceTooLow-${var.elasticsearch_cluster_name}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/ES"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "${local.thresholds["FreeStorageSpaceThreshold"]}"
  alarm_description   = "Average elasticsearch free storage space over last 1 minutes is too low"
  alarm_actions       = ["${var.sns_topic_arn}"]
  ok_actions          = ["${var.sns_topic_arn}"]
  treat_missing_data  = "ignore"

  dimensions {
    DomainName = "${var.elasticsearch_cluster_name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "cluster_index_writes_blocked" {
  alarm_name          = "ElasticSearch-ClusterIndexWritesBlocked-${var.elasticsearch_cluster_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ClusterIndexWritesBlocked"
  namespace           = "AWS/ES"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "Elasticsearch index writes being blocker over last 10 minutes"
  alarm_actions       = ["${var.sns_topic_arn}"]
  ok_actions          = ["${var.sns_topic_arn}"]
  treat_missing_data  = "ignore"

  dimensions {
    DomainName = "${var.elasticsearch_cluster_name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "automated_snapshot_failure" {
  alarm_name          = "ElasticSearch-AutomatedSnapshotFailure-${var.elasticsearch_cluster_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "AutomatedSnapshotFailure"
  namespace           = "AWS/ES"
  period              = "600"
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "Elasticsearch automated snapshot failed over last 10 minutes"
  alarm_actions       = ["${var.sns_topic_arn}"]
  ok_actions          = ["${var.sns_topic_arn}"]
  treat_missing_data  = "ignore"

  dimensions {
    DomainName = "${var.elasticsearch_cluster_name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_too_high" {
  alarm_name          = "ElasticSearch-CPUUtilizationTooHigh-${var.elasticsearch_cluster_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ES"
  period              = "900"
  statistic           = "Average"
  threshold           = "${local.thresholds["CPUUtilizationThreshold"]}"
  alarm_description   = "Average elasticsearch cluster CPU utilization over last 10 minutes too high"
  alarm_actions       = ["${var.sns_topic_arn}"]
  ok_actions          = ["${var.sns_topic_arn}"]

  dimensions {
    DomainName = "${var.elasticsearch_cluster_name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "jvm_memory_pressure_too_high" {
  alarm_name          = "ElasticSearch-JVMMemoryPressure-${var.elasticsearch_cluster_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "JVMMemoryPressure"
  namespace           = "AWS/ES"
  period              = "900"
  statistic           = "Maximum"
  threshold           = "${local.thresholds["JVMMemoryPressureThreshold"]}"
  alarm_description   = "Elasticsearch JVM memory pressure is too high over last 10 minutes"
  alarm_actions       = ["${var.sns_topic_arn}"]
  ok_actions          = ["${var.sns_topic_arn}"]

  dimensions {
    DomainName = "${var.elasticsearch_cluster_name}"
  }
}
