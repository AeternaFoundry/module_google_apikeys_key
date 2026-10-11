variable "apikeys_keys" {
  description = <<EOT
Map of apikeys_keys, attributes below
Required:
    - name
Optional:
    - check_existing_usage
    - deletion_policy
    - display_name
    - project
    - service_account_email
    - restrictions (block):
        - android_key_restrictions (optional, block):
            - allowed_applications (required, block):
                - package_name (required)
                - sha1_fingerprint (required)
        - api_targets (optional, block):
            - methods (optional)
            - service (required)
        - browser_key_restrictions (optional, block):
            - allowed_referrers (required)
        - ios_key_restrictions (optional, block):
            - allowed_bundle_ids (required)
        - server_key_restrictions (optional, block):
            - allowed_ips (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name                  = string
    check_existing_usage  = optional(string)
    deletion_policy       = optional(string)
    display_name          = optional(string)
    project               = optional(string)
    service_account_email = optional(string)
    restrictions = optional(object({
      android_key_restrictions = optional(object({
        allowed_applications = list(object({
          package_name     = string
          sha1_fingerprint = string
        }))
      }))
      api_targets = optional(list(object({
        methods = optional(list(string))
        service = string
      })))
      browser_key_restrictions = optional(object({
        allowed_referrers = list(string)
      }))
      ios_key_restrictions = optional(object({
        allowed_bundle_ids = list(string)
      }))
      server_key_restrictions = optional(object({
        allowed_ips = list(string)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.apikeys_keys : (
        v.restrictions == null || (v.restrictions.android_key_restrictions == null || (length(v.restrictions.android_key_restrictions.allowed_applications) >= 1))
      )
    ])
    error_message = "Each allowed_applications list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.apikeys_keys : (
        v.check_existing_usage == null || (contains(["SKIP", "CHECK"], v.check_existing_usage))
      )
    ])
    error_message = "must be one of: \"SKIP\", \"CHECK\""
  }
}

