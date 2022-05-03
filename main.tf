terraform {
  backend "s3" {
    encrypt = true
    bucket  = "indent-example-bucket"
    region  = "us-west-2"
    key     = "indent/terraform.tfstate"
  }
}

module "tailscale-pull-webhook" {
  source = "./terraform"

  indent_webhook_secret = var.tailscale_pull_webhook_secret
  tailscale_key         = var.tailscale_key
  tailscale_tailnet     = var.tailscale_tailnet
}

module "tailscale-change-webhook" {
  source = "./terraform"

  indent_webhook_secret = var.tailscale_webhook_secret
  tailscale_key         = var.tailscale_key
  tailscale_tailnet     = var.tailscale_tailnet
}
