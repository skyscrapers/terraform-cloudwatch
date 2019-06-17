variable "sns_topic_arn" {
  description = "ARN of the SNS topic you want the alerts to be sent to"
}

// Lambda Function name
variable "lambda_function" {
  type        = string
  description = "Name of the lambda function to monitor"
}

// Lambda Invocation Error Alarm Settings

variable "lambda_invocation_error_threshold" {
  default     = "5"
  description = "The value against which the specified statistic is compared."
}

variable "lambda_invocation_error_evaluation_periods" {
  default     = "1"
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "lambda_invocation_error_period" {
  default     = "60"
  description = "The period in seconds over which the specified stat is applied."
}

// Lambda Throttling Alarm Settings
variable "lambda_throttle_error_threshold" {
  default     = "0"
  description = "The value against which the specified statistic is compared."
}

variable "lambda_throttle_error_evaluation_periods" {
  default     = "1"
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "lambda_throttle_error_period" {
  default     = "60"
  description = "The period in seconds over which the specified stat is applied."
}

// Lambda Iterator Age Alarm Settings
variable "lambda_iterator_age_error_threshold" {
  default     = "1000000"
  description = "The value against which the specified statistic is compared."
}

variable "lambda_iterator_age_error_evaluation_periods" {
  default     = "1"
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "lambda_iterator_age_error_period" {
  default     = "60"
  description = "The period in seconds over which the specified stat is applied."
}

