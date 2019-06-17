variable "sns_topic_arn" {
  description = "ARN of the SNS topic you want the alerts to be sent to"
}

// ElasticSearch cluster name
variable "elasticsearch_cluster_name" {
  description = "Name of the ElasticSearch cluster to monitor"
  type        = string
}

variable "aws_clientid" {
  description = "AWS ID of the account where the elasticsearch domain is running"
  type        = string
}

variable "free_storage_space_threshold" {
  description = "The minimum amount of available storage space in MegaByte."
  type        = number
  default     = 512
}

variable "cpu_utilization_threshold" {
  description = "The maximum percentage of CPU utilization"
  type        = number
  default     = 95
}

variable "jvm_memory_pressure_threshold" {
  description = "The maximum percentage of the Java heap used for all data nodes in the cluster"
  type        = number
  default     = 95
}
