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
    create          = bool
    service_account = string
    scope           = string
  })
  description = "Service acccount for Triggering the Function"
  default     = null
}

variable "invoker_members" {
  type        = list(string)
  description = "Cloudfunction can be invoked by the members defined in this list"
  default     = []
}

variable "is_public_function" {
  type        = bool
  description = "Cloudfunction can be invoked by all users - Public function"
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

variable "retry_config" {
  type = object({
    retry_count          = number
    max_retry_duration   = string
    min_backoff_duration = string
    max_backoff_duration = string
    max_doublings        = number
  })
  description = "If a job does not complete successfully, meaning that an acknowledgement is not received from the handler, then it will be retried with exponential backoff according to the settings"
  default     = null
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

variable "time_zone" {
  type        = string
  description = "Specifies the time zone to be used in interpreting schedule. The value of this field must be a time zone name from the tz database."
  default     = "Etc/UTC"
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
    message_attributes          = map(string)
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
