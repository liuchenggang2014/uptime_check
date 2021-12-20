resource "google_monitoring_uptime_check_config" "https" {
  display_name = "https-uptime-check"
  timeout      = "10s"
  period = "60s"

  http_check {
    path         = "/hc.html"
    port         = "443"
    use_ssl      = true
    validate_ssl = true
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      host       = "glb.goodvm.net"
    }
  }

}
