output "idt-tailscale-webhook-url" {
  value       = module.idt-tailscale-webhook.function_url
  description = "The URL of the deployed Lambda"
}

