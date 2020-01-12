output "service_account" {
  value       = module.main.service_account
  description = "Service Account for the Cloud Function"
}

output "name" {
  value       = module.main.name
  description = "The name for the Cloudfunction"
}

output "project_id" {
  value       = module.main.project
  description = "ID of the project to which the Cloudfunction is deployed"
}

output "region" {
  value       = module.main.region
  description = "Region to which the Cloudfunction is deployed"
}

output "https_trigger_url" {
  value       = module.main.https_trigger_url
  description = "URL which triggers function execution. Returned only if trigger_http is used."
}

output "source_repository" {
  value       = module.main.source_repository
  description = "The URL pointing to the hosted repository where the function was defined at the time of deployment."
}

output "runtime" {
  value       = module.main.runtime
  description = "The runtime in which the function is going to run"
}

output "available_memory_mb" {
  value       = module.main.available_memory_mb
  description = "Memory (in MB), available to the function."
}

output "service_account_email" {
  value       = module.main.service_account_email
  description = "The email for the Service Account to run the function with"
}

output "entry_point" {
  value       = module.main.entry_point
  description = "Name of the function that will be executed when the Google Cloud Function is triggered."
}
