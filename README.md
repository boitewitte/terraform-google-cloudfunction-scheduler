# Terraform Module: Google CloudFunction Scheduler

Schedule Cloudfunction execution with CloudScheduler

**Requires [AppEngine app](https://cloud.google.com/scheduler/docs/)**

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| entry\_point | Name of the function that will be executed when the Google Cloud Function is triggered. | `string` | n/a | yes |
| name | A user-defined name of the function. Function names must be unique globally. | `string` | n/a | yes |
| region | Region to which the Cloudfunction will be deployed | `string` | n/a | yes |
| runtime | The runtime in which the function is going to run. | `string` | n/a | yes |
| available\_memory\_mb | Memory (in MB), available to the function. Default value is 256MB. Allowed values are: 128MB, 256MB, 512MB, 1024MB, and 2048MB. | `string` | `"256MB"` | no |
| description | Description of the Cloudfunction | `string` | `"null"` | no |
| environment\_variables | A set of key/value environment variable pairs to assign to the function. | `map(string)` | `"null"` | no |
| event\_triggers | A source that fires events in response to a condition in another service. Can't be used in conjunction with trigger\_http | `object` | `[]` | no |
| function\_source | Defines the Source configuration for the Cloudfunction. Can't be used in conjunction with source\_repository\_url | `object` | `"null"` | no |
| http | Configuration for the HTTP trigger | `object` | `"null"` | no |
| http\_oauth\_token | Service acccount for Triggering the Function | `object` | `"null"` | no |
| invoker\_members | Cloudfunction can be invoked by the members defined in this list | `list(string)` | `[]` | no |
| is\_public\_function | Cloudfunction can be invoked by all users - Public function | `bool` | `false` | no |
| labels | A set of key/value label pairs to assign to the function. | `map(string)` | `{}` | no |
| max\_instances | The limit on the maximum number of function instances that may coexist at a given time. | `number` | `"null"` | no |
| project\_id | The Project ID to which the function will be deployed | `string` | `"null"` | no |
| project\_roles | List of roles within other projects that will be attached to the Cloudfunction | `object` | `[]` | no |
| pubsub | The configuration for the PubSub, if null, the HTML trigger will be used | `object` | `"null"` | no |
| roles | List of roles that will be attached to the Cloudfunction within the same project | `list(string)` | `[]` | no |
| source\_repository\_url | The URL pointing to the hosted Cloud Source repository where the function is defined. | `string` | `"null"` | no |
| timeout | Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds. | `number` | `60` | no |
| vpc\_connector | The VPC Network Connector that this cloud function can connect to. | `string` | `"null"` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
