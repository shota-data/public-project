variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "module_name" {
  type    = string
  default = "bq-check"
}

variable "slack_webhook_url" {
  type = string
}
