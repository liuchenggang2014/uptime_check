provider "google" {
  # Update credentials to the correct location, alternatively set   GOOGLE_APPLICATION_CREDENTIALS=/path/to/.ssh/sa.json in your shell session and   remove the credentials attribute.
  #   credentials = file("sa.json")
  project = "cliu201"
  region  = "us-central1"
  zone    = "us-central1-a"

}


locals {
  # input your multiple https host and path into the map
  https_host_path_map = {
    "glb.goodvm.net" = "/hc.html"
    "www.google.com" = "/"
  }

  # input your multiple tcp host and port into the map
  tcp_host_port_map = {
    "34.102.160.165" = 1883
    "164.52.56.106" = 11000
  }

}


