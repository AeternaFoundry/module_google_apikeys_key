resource "google_apikeys_key" "apikeys_keys" {
  for_each = var.apikeys_keys

  name                  = each.value.name
  check_existing_usage  = each.value.check_existing_usage
  deletion_policy       = each.value.deletion_policy
  display_name          = each.value.display_name
  project               = each.value.project
  service_account_email = each.value.service_account_email

  dynamic "restrictions" {
    for_each = each.value.restrictions != null ? [each.value.restrictions] : []
    content {
      dynamic "android_key_restrictions" {
        for_each = restrictions.value.android_key_restrictions != null ? [restrictions.value.android_key_restrictions] : []
        content {
          dynamic "allowed_applications" {
            for_each = android_key_restrictions.value.allowed_applications
            content {
              package_name     = allowed_applications.value.package_name
              sha1_fingerprint = allowed_applications.value.sha1_fingerprint
            }
          }
        }
      }
      dynamic "api_targets" {
        for_each = restrictions.value.api_targets != null ? restrictions.value.api_targets : []
        content {
          methods = api_targets.value.methods
          service = api_targets.value.service
        }
      }
      dynamic "browser_key_restrictions" {
        for_each = restrictions.value.browser_key_restrictions != null ? [restrictions.value.browser_key_restrictions] : []
        content {
          allowed_referrers = browser_key_restrictions.value.allowed_referrers
        }
      }
      dynamic "ios_key_restrictions" {
        for_each = restrictions.value.ios_key_restrictions != null ? [restrictions.value.ios_key_restrictions] : []
        content {
          allowed_bundle_ids = ios_key_restrictions.value.allowed_bundle_ids
        }
      }
      dynamic "server_key_restrictions" {
        for_each = restrictions.value.server_key_restrictions != null ? [restrictions.value.server_key_restrictions] : []
        content {
          allowed_ips = server_key_restrictions.value.allowed_ips
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

