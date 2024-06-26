# bq-check

Slack alert functions for Google BigQuery query performance and billing with Cloud Functions.

Sample Slack alert.

<!-- ![SlackAlert](./image.png) -->

## Architecture

`BigQuery Log(Cloud Logging) --> Cloud PubSub --> Cloud Functions(filter and notify) --> Slack`

## How to use

### Requirements

- Terraform 0.13 or later
- Python 3.9
- google-cloud-sdk
- Slack Webhook URL

### Settings

Set your config and customize message in [`./src/config.py`](./src/config.py)

```python
SLACK_ICON_EMOJI  = ':male-check-officer:'
SLACK_USERNAME    = 'bq-check'
SLACK_CHANNEL     = 'random'
SLOT_ALERT_THRESHOLD           = 7200000  # 120min slots
BILLED_BYTE_ALERT_THRESHOLD    = 5*1000*1000*1000*1000  # 5TB(60000000slot/ROUND)
PROCESSED_BYTE_ALERT_THRESHOLD = 5*1000*1000*1000*1000  # 5TB(60000000slot/ROUND)
SLACK_ALERT_MESSAGE_TEXT = "Query Alert!!"
```

### Deploy

1. Google Login.

```bash
gcloud auth application-default login
```

1. terraform plan and apply with your GCP Project ID.

```bash
cd infrastructure/terraform
terraform init
export TF_VAR_project_id=<your GCP Project ID>
export TF_VAR_slack_webhook_url=<your Slack Webhook URL>
terraform plan
terraform apply
```

### Test

TBD
