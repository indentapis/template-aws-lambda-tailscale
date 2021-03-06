terraform {
  backend "s3" {
    encrypt = true
    bucket  = ""
    region  = "us-west-2"
    key     = "indent/terraform.tfstate"
  }

}

# Indent + Tailscale Integration

# Details: https://github.com/indentapis/integrations/tree/497921b068637f081987bafe64a2e65a151765f6/packages/stable/indent-integration-tailscale
# Last Change: https://github.com/indentapis/integrations/commit/497921b068637f081987bafe64a2e65a151765f6

module "idt-tailscale-webhook" {
  source                = "git::https://github.com/indentapis/integrations//terraform/modules/indent_runtime_aws_lambda"
  name                  = "idt-tailscale-webhook"
  indent_webhook_secret = var.indent_webhook_secret
  artifact = {
    bucket       = "indent-artifacts-us-west-2"
    function_key = "webhooks/aws/lambda/tailscale-497921b068637f081987bafe64a2e65a151765f6-function.zip"
    deps_key     = "webhooks/aws/lambda/tailscale-497921b068637f081987bafe64a2e65a151765f6-deps.zip"
  }
  env = {
    TAILSCALE_TAILNET = var.tailscale_tailnet
    TAILSCALE_API_KEY = var.tailscale_api_key
  }
}

