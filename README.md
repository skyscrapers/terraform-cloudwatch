# terraform-cloudwatch

N.B. Releases >= 2.0.0 been upgraded to use Terraform 0.12.n.

Terraform module to setup cloudwatch alerts and push them to SNS. This repository contains the following modules:

* `api-gateway`: Creates general alerts for the api-gateway.
* `dynamodb`: Creates the alerts needed for a dynamodb table.
* `kinesis`: Creates alerts for a kinesis stream. This is used in the `skyscrapers/terraform-kinesis` module.
* `lambda_function`: Creates the alerts for lambda functions.

## API-Gateway

Creates general alerts for the API-Gateway.

N.B. Releases >= 2.0.0 the `5XXError...` variables are now `fiveXXError...` as variables cannot start with a number.

The following resources are created:

* Cloudwatch alerts for the API-Gateway that was passed as variable

### Available variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| fiveXXError\_error\_period | The period in seconds over which the specified stat is applied. | string | `"60"` | no |
| fiveXXError\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | string | `"1"` | no |
| fiveXXError\_threshold | The value against which the specified statistic is compared. | string | `"5"` | no |
| api\_gateway | Name of the API Gateway to monitor | string | n/a | yes |
| integrationlatency\_error\_period | The period in seconds over which the specified stat is applied. | string | `"60"` | no |
| integrationlatency\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | string | `"2"` | no |
| integrationlatency\_threshold | The value against which the specified statistic is compared. | string | `"5000"` | no |
| latency\_error\_period | The period in seconds over which the specified stat is applied. | string | `"60"` | no |
| latency\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | string | `"2"` | no |
| latency\_threshold | The value against which the specified statistic is compared. | string | `"5000"` | no |
| sns\_topic\_arn | ARN of the SNS topic you want the alerts to be sent to | string | n/a | yes |

## DynamoDB

Creates the alerts needed for a DynamoDB table.

### Available variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dynamodb\_table\_name | Name of the dynamodb table to monitor | string | n/a | yes |
| dynamodb\_throttle\_evaluation\_periods | The period in seconds over which the specified stat is applied. | string | `"1"` | no |
| dynamodb\_throttle\_period | The number of periods over which data is compared to the specified threshold. | string | `"60"` | no |
| dynamodb\_throttle\_threshold | The value against which the specified statistic is compared. | string | `"0"` | no |
| sns\_topic\_arn | ARN of the SNS topic you want the alerts to be sent to | string | n/a | yes |


## ElasticSearch

Creates the alerts needed for a ElasticSearch domain.

### Available variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_utilization\_threshold | The maximum percentage of CPU utilization | string | `"95"` | no |
| elasticsearch\_cluster\_name | Name of the ElasticSearch cluster to monitor | string | n/a | yes |
| free\_storage\_space\_threshold | The minimum amount of available storage space in MegaByte. | string | `"512"` | no |
| jvm\_memory\_pressure\_threshold | The maximum percentage of the Java heap used for all data nodes in the cluster | string | `"95"` | no |
| sns\_topic\_arn | ARN of the SNS topic you want the alerts to be sent to | string | n/a | yes |

## Kinesis

Creates alerts for a Kinesis stream. This is used in the `skyscrapers/terraform-kinesis` module.

The following resources are created:

* Cloudwatch alerts for the kinesis stream that was passed as variable

### Available variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| kinesis\_iterator\_age\_error\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | string | `"1"` | no |
| kinesis\_iterator\_age\_error\_period | The period in seconds over which the specified stat is applied. | string | `"300"` | no |
| kinesis\_iterator\_age\_error\_threshold | The value against which the specified statistic is compared. | string | `"1000000"` | no |
| kinesis\_stream\_name | Name of the kinesis stream to monitor | string | n/a | yes |
| kinesis\_write\_throughput\_exceeded\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | string | `"6"` | no |
| kinesis\_write\_throughput\_exceeded\_period | The period in seconds over which the specified stat is applied. | string | `"300"` | no |
| kinesis\_write\_throughput\_exceeded\_threshold | The value against which the specified statistic is compared. | string | `"10"` | no |
| sns\_topic\_arn | ARN of the SNS topic you want the alerts to be sent to | string | n/a | yes |

## lambda_function

 Creates the alerts for Lambda functions.

### Available variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| lambda\_function | Name of the lambda function to monitor | string | n/a | yes |
| lambda\_invocation\_error\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | string | `"1"` | no |
| lambda\_invocation\_error\_period | The period in seconds over which the specified stat is applied. | string | `"60"` | no |
| lambda\_invocation\_error\_threshold | The value against which the specified statistic is compared. | string | `"5"` | no |
| lambda\_invocation\_error\_treat\_missing\_data | Sets how this alarm is to handle missing data points. | string | `"missing"` | no |
| lambda\_iterator\_age\_error\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | string | `"1"` | no |
| lambda\_iterator\_age\_error\_period | The period in seconds over which the specified stat is applied. | string | `"60"` | no |
| lambda\_iterator\_age\_error\_threshold | The value against which the specified statistic is compared. | string | `"1000000"` | no |
| lambda\_throttle\_error\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | string | `"1"` | no |
| lambda\_throttle\_error\_period | The period in seconds over which the specified stat is applied. | string | `"60"` | no |
| lambda\_throttle\_error\_threshold | The value against which the specified statistic is compared. | string | `"0"` | no |
| sns\_topic\_arn | ARN of the SNS topic you want the alerts to be sent to | string | n/a | yes |
