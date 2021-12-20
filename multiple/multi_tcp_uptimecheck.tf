resource "google_monitoring_uptime_check_config" "tcp_group" {
  for_each = local.tcp_host_port_map

  display_name = "tcp-uptime-check-${each.key}"
  timeout      = "10s"
  period = "60s"

  tcp_check {
    port = each.value
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      host = each.key
    }
  }
}
