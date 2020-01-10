variable "available_memory_mb" {
  type        = string
  description = "Memory (in MB), available to the function. Default value is 256MB. Allowed values are: 128MB, 256MB, 512MB, 1024MB, and 2048MB."
  default     = "256MB"
}

variable "description" {
  type        = string
  description = "Description of the Cloudfunction"
  default     = null
}

variable "environment_variables" {
  type        = map(string)
  description = "A set of key/value environment variable pairs to assign to the function."
  default     = null
}

variable "entry_point" {
  type        = string
  description = "Name of the function that will be executed when the Google Cloud Function is triggered."
}

variable "event_triggers" {
  type = list(object({
    event_type = string
    resource   = string
    retry      = bool
  }))
  description = "A source that fires events in response to a condition in another service. Can't be used in conjunction with trigger_http"
  default     = []
}

variable "http" {
  type = object({
    http_method  = string
    body         = string
    query_string = string
    headers      = map(string)
  })
  description = "Configuration for the HTTP trigger"
  default     = null
}

variable "http_oauth_token" {
  type = object({
    create                = bool
    service_account_email = string
    scope                 = string
  })
  description = "Service acccount for Triggering the Function"
  default     = null
}

variable "function_source" {
  type = object({
    name      = string
    bucket    = string
    directory = string
    file      = string
  })
  description = "Defines the Source configuration for the Cloudfunction. Can't be used in conjunction with source_repository_url"
  default     = null
}

variable "invokers" {
  type        = list(string)
  description = "List of IAM members who are allowed to invoke the function"
  default     = []
}

variable "is_public_function" {
  type        = bool
  description = "Gives all users the right to invoke the function"
  default     = false
}

variable "labels" {
  type        = map(string)
  description = "A set of key/value label pairs to assign to the function."
  default     = {}
}

variable "max_instances" {
  type        = number
  description = "The limit on the maximum number of function instances that may coexist at a given time."
  default     = null
}

variable "name" {
  type        = string
  description = "A user-defined name of the function. Function names must be unique globally."
}

variable "project_id" {
  type        = string
  description = "The Project ID to which the function will be deployed"
  default     = null
}

variable "project_roles" {
  type        = list(object({ project_id = string, role = string }))
  description = "List of roles within other projects that will be attached to the Cloudfunction"
  default     = []
}

variable "region" {
  type        = string
  description = "Region to which the Cloudfunction will be deployed"
}

variable "runtime" {
  type        = string
  description = "The runtime in which the function is going to run."
}

variable "roles" {
  type        = list(string)
  description = "List of roles that will be attached to the Cloudfunction within the same project"
  default     = []
}

variable "source_repository_url" {
  type        = string
  description = "The URL pointing to the hosted Cloud Source repository where the function is defined."
  default     = null
}

variable "timeout" {
  type        = number
  description = "Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds."
  default     = 60
}

variable "pubsub" {
  type = object({
    topic_name                  = string
    create                      = bool
    message_data                = string
    kms_key_name                = string
    allowed_persistence_regions = list(string)
  })
  description = "The configuration for the PubSub, if null, the HTML trigger will be used"
  default     = null
}

variable "vpc_connector" {
  type        = string
  description = "The VPC Network Connector that this cloud function can connect to."
  default     = null
}
