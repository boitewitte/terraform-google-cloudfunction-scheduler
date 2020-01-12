
resource "google_service_account" "this" {
  count = var.http_oauth_token != null ? (var.http_oauth_token.create ? 1 : 0) : 0

  account_id   = var.http_oauth_token.service_account
  display_name = "${var.name} - ${var.http_oauth_token.service_account}"
  description  = "CloudScheduler Job: ${var.name}"

  project = var.project_id
}

locals {
  oauth_service_account_email = (
    var.http_oauth_token != null
    ? (
      length(google_service_account.this) > 0 ? google_service_account.this[0].email : var.http_oauth_token.service_account
    )
    : ""
  )

  pubsub_target = (
    var.pubsub != null
    ? [{
      topic_name = var.pubsub.topic_name
      data       = var.pubsub.message_data
      attributes = var.pubsub.message_attributes
    }]
    : []
  )

  http_target = (
    var.http != null
    ? [
      merge(
        {
          uri = join(
            "?",
            compact(
              concat(
                [module.main.https_trigger_url],
                var.http.query_string != null ? [var.http.query_string] : []
              )
            )
          )
          http_method = var.http.http_method
          body        = var.http.body
          headers     = var.http.headers
          oauth_token = (
            local.oauth_service_account_email != ""
            ? [{
              service_account_email = local.oauth_service_account_email
              scope                 = var.http_oauth_token.scope != null ? var.http_oauth_token.scope : "https://www.googleapis.com/auth/cloud-platform"
            }]
            : []
          )
        }
      )
    ]
    : []
  )

  retry_config = var.retry_config != null ? [var.retry_config] : []
}

resource "google_cloud_scheduler_job" "this" {
  name        = var.name
  description = var.description
  schedule    = var.schedule
  time_zone   = var.time_zone

  dynamic "http_target" {
    for_each = local.http_target

    content {
      uri         = http_target.value.uri
      http_method = http_target.value.http_method
      body        = http_target.value.body
      headers     = http_target.value.headers

      dynamic "oauth_token" {
        foreach = http_target.value.oauth_token

        content {
          service_account_email = oauth_token.value.service_account_email
          scope                 = oauth_token.value.scope
        }
      }
    }
  }

  dynamic "pubsub_target" {
    for_each = local.pubsub_target

    content {
      topic_name = pubsub_target.value.topic_name
      data       = pubsub_target.value.data
      attributes = pubsub_target.value.attributes
    }
  }

  dynamic "retry_config" {
    for_each = local.retry_config

    content {
      retry_count          = retry_config.value.retry_count
      max_retry_duration   = retry_config.value.max_retry_duration
      min_backoff_duration = retry_config.value.min_backoff_duration
      max_backoff_duration = retry_config.value.max_backoff_duration
      max_doublings        = retry_config.value.max_doublings
    }
  }
}
