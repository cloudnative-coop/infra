resource "github_repository_webhook" "flux_webhook" {
  repository = var.repo

  configuration {
    url          = "https://flux-webhook.${var.domain}${data.kubernetes_resource.receiver.object.status.webhookPath}"
    content_type = "application/x-www-form-urlencoded"
    insecure_ssl = false
    secret       = var.secret
  }

  active = true

  events = ["push", "ping"]
}
