variable "sns_topic_arn" {
  description = "ARN of the SNS topic you want the alerts to be sent to"
}

// API Gateway name
variable "api_gateway" {
  type        = string
  description = "Name of the API Gateway to monitor"
}

// API Gateway 5XXError Alarm Settings

variable "fiveXXError_threshold" {
  default     = "5"
  description = "The value against which the specified statistic is compared."
}

variable "fiveXXError_evaluation_periods" {
  default     = "1"
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "fiveXXError_period" {
  default     = "60"
  description = "The period in seconds over which the specified stat is applied."
}

// API Gateway Latency Alarm Settings

variable "latency_threshold" {
  default     = "5000"
  description = "The value against which the specified statistic is compared."
}

variable "latency_evaluation_periods" {
  default     = "2"
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "latency_period" {
  default     = "60"
  description = "The period in seconds over which the specified stat is applied."
}

// API Gateway IntegrationLatency Alarm Settings

variable "integrationlatency_threshold" {
  default     = "5000"
  description = "The value against which the specified statistic is compared."
}

variable "integrationlatency_evaluation_periods" {
  default     = "2"
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "integrationlatency_period" {
  default     = "60"
  description = "The period in seconds over which the specified stat is applied."
}

