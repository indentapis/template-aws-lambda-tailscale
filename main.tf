terraform {
  backend "s3" {
    encrypt = true
    bucket  = ""
    region  = "us-west-2"
    key     = "indent/terraform.tfstate"
  }

}

# Indent + Tailscale Integration

# Details: https://github.com/indentapis/integrations/tree/df93ce81224dfff61d9ccf885101f190a08fd724/packages/stable/indent-integration-tailscale
# Last Change: https://github.com/indentapis/integrations/commit/df93ce81224dfff61d9ccf885101f190a08fd724

module "idt-tailscale-webhook" {
  source                = "git::https://github.com/indentapis/integrations//terraform/modules/indent_runtime_aws_lambda"
  name                  = "idt-tailscale-webhook"
  indent_webhook_secret = var.indent_webhook_secret
  artifact = {
    bucket       = "indent-artifacts-us-west-2"
    function_key = "webhooks/aws/lambda/tailscale-df93ce81224dfff61d9ccf885101f190a08fd724-function.zip"
    deps_key     = "webhooks/aws/lambda/tailscale-df93ce81224dfff61d9ccf885101f190a08fd724-deps.zip"
  }
  env = {
    TAILSCALE_TAILNET = var.tailscale_tailnet
    TAILSCALE_API_KEY = var.tailscale_api_key
  }
}

