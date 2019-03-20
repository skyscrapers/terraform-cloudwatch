variable "sns_topic_arn" {
  description = "ARN of the SNS topic you want the alerts to be sent to"
}

// Dynamodb table name
variable "dynamodb_table_name" {
  type        = "string"
  description = "Name of the dynamodb table to monitor"
}

//Alarm settings
variable "dynamodb_throttle_threshold" {
  default     = 0
  description = "The value against which the specified statistic is compared."
}

variable "dynamodb_throttle_period" {
  default     = 60
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "dynamodb_throttle_evaluation_periods" {
  default     = 1
  description = "The period in seconds over which the specified stat is applied."
}
