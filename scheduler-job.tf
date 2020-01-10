locals {
  pubsub_target = (
    var.pubsub != null
    ? [
      merge(
        {
          topic_name = var.pubsub.topic_name
        },
        var.pubsub.message_data != null ? { data = var.pubsub.message_data } : {}
      )
    ]
    : []
  )

  http_target = (
    
  )
}

resource "google_cloud_scheduler_job" "this" {
  name        = var.name
  description = var.description
  schedule    = var.schedule
}
