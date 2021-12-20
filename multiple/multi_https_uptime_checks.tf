resource "google_monitoring_uptime_check_config" "https" {
  for_each = local.https_host_path_map

  display_name = "multi-https-uptime-check-${each.key}"
  timeout      = "10s"
  period = "60s"

  http_check {
    path         = each.value
    port         = "443"
    use_ssl      = true
    validate_ssl = true
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      host       = each.key
    }
  }

}
