resource "google_monitoring_alert_policy" "https_uptime_alert" {
  display_name = "https-uptime-alert"
  combiner     = "OR"
  conditions {
    display_name = "https-uptime-alert-condition"
    condition_threshold {
      filter     = "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\" AND metric.label.check_id=\"${google_monitoring_uptime_check_config.https.uptime_check_id}\" AND resource.type=\"uptime_url\""
      threshold_value = 1
      duration   = "60s"
      comparison = "COMPARISON_GT"

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "1200s"
        per_series_aligner = "ALIGN_NEXT_OLDER"
        cross_series_reducer = "REDUCE_COUNT_FALSE"
        group_by_fields = ["resource.label.*"]

      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.basic.name]

}