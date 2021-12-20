resource "google_monitoring_notification_channel" "basic" {
  display_name = "Multiple HC Notification Channel"
  type         = "email"
  labels = {
    email_address = "fake_email_mul@blahblah.com"
  }
}