# terraform-cloudwatch

Terraform module to setup cloudwatch alerts and push them to SNS. This repository contains the following modules:

* `kinesis`: Creates alerts for a kinesis stream. This is used in the `skyscrapers/terraform-kinesis` module.
* `dynamodb`: Creates the alerts needed for a dynamodb table.
* `lambda_function`: Creates the alerts for lambda functions.

## kinesis
Creates alerts for a kinesis stream. This is used in the `skyscrapers/terraform-kinesis` module.

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

## dynamodb

Creates the alerts needed for a dynamodb table.

### Available variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dynamodb\_table\_name | Name of the dynamodb table to monitor | string | n/a | yes |
| dynamodb\_throttle\_evaluation\_periods | The period in seconds over which the specified stat is applied. | string | `"1"` | no |
| dynamodb\_throttle\_period | The number of periods over which data is compared to the specified threshold. | string | `"60"` | no |
| dynamodb\_throttle\_threshold | The value against which the specified statistic is compared. | string | `"0"` | no |
| sns\_topic\_arn | ARN of the SNS topic you want the alerts to be sent to | string | n/a | yes |

## lambda_function

 Creates the alerts for lambda functions.

### Available variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| lambda\_function | Name of the lambda function to monitor | string | n/a | yes |
| lambda\_invocation\_error\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | string | `"1"` | no |
| lambda\_invocation\_error\_period | The period in seconds over which the specified stat is applied. | string | `"60"` | no |
| lambda\_invocation\_error\_threshold | The value against which the specified statistic is compared. | string | `"5"` | no |
| lambda\_iterator\_age\_error\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | string | `"1"` | no |
| lambda\_iterator\_age\_error\_period | The period in seconds over which the specified stat is applied. | string | `"60"` | no |
| lambda\_iterator\_age\_error\_threshold | The value against which the specified statistic is compared. | string | `"1000000"` | no |
| lambda\_throttle\_error\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | string | `"1"` | no |
| lambda\_throttle\_error\_period | The period in seconds over which the specified stat is applied. | string | `"60"` | no |
| lambda\_throttle\_error\_threshold | The value against which the specified statistic is compared. | string | `"0"` | no |
| sns\_topic\_arn | ARN of the SNS topic you want the alerts to be sent to | string | n/a | yes |
