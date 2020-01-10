locals {
  is_valid = var.http != null || var.pubsub != null

  pubsub_event_trigger = (
    var.pubsub != null
    ? []
    : []
  )



  event_triggers = (
    var.pubsub == null
    ? []
    : concat(local.pubsub_event_trigger, var.event_triggers)
  )



}

module "main" {
  source = "git::ssh://git@bitbucket.org/reclamefolder/terraform-google-cloudfunction.git"

  name          = var.name
  description   = var.description
  project_id    = var.project_id
  region        = var.region
  vpc_connector = var.vpc_connector

  runtime             = var.runtime
  available_memory_mb = var.available_memory_mb
  max_instances       = var.max_instances
  timeout             = var.timeout

  function_source       = var.function_source
  source_repository_url = var.source_repository_url
  entry_point           = var.entry_point
  environment_variables = var.environment_variables

  labels = var.labels

  trigger_http       = var.pubsub == null
  is_public_function = var.is_public_function || var.pubsub == null
  event_triggers     = local.event_triggers
}
