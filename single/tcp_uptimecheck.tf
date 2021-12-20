resource "google_monitoring_uptime_check_config" "tcp_group" {
  display_name = "tcp-uptime-check"
  timeout      = "10s"
  period = "60s"

  tcp_check {
    port = 1883
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      host = "34.102.160.165"
    }
  }
}
