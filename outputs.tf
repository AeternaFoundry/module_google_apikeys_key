output "apikeys_keys_id" {
  description = "Map of id values across all apikeys_keys, keyed the same as var.apikeys_keys except keys with no id are omitted"
  value       = { for k, v in google_apikeys_key.apikeys_keys : k => v.id if v.id != null && length(v.id) > 0 }
}
output "apikeys_keys_check_existing_usage" {
  description = "Map of check_existing_usage values across all apikeys_keys, keyed the same as var.apikeys_keys except keys with no check_existing_usage are omitted"
  value       = { for k, v in google_apikeys_key.apikeys_keys : k => v.check_existing_usage if v.check_existing_usage != null && length(v.check_existing_usage) > 0 }
}
output "apikeys_keys_deletion_policy" {
  description = "Map of deletion_policy values across all apikeys_keys, keyed the same as var.apikeys_keys except keys with no deletion_policy are omitted"
  value       = { for k, v in google_apikeys_key.apikeys_keys : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "apikeys_keys_display_name" {
  description = "Map of display_name values across all apikeys_keys, keyed the same as var.apikeys_keys except keys with no display_name are omitted"
  value       = { for k, v in google_apikeys_key.apikeys_keys : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "apikeys_keys_key_string" {
  description = "Map of key_string values across all apikeys_keys, keyed the same as var.apikeys_keys except keys with no key_string are omitted"
  value       = { for k, v in google_apikeys_key.apikeys_keys : k => v.key_string if v.key_string != null && length(v.key_string) > 0 }
  sensitive   = true
}
output "apikeys_keys_name" {
  description = "Map of name values across all apikeys_keys, keyed the same as var.apikeys_keys except keys with no name are omitted"
  value       = { for k, v in google_apikeys_key.apikeys_keys : k => v.name if v.name != null && length(v.name) > 0 }
}
output "apikeys_keys_project" {
  description = "Map of project values across all apikeys_keys, keyed the same as var.apikeys_keys except keys with no project are omitted"
  value       = { for k, v in google_apikeys_key.apikeys_keys : k => v.project if v.project != null && length(v.project) > 0 }
}
output "apikeys_keys_restrictions" {
  description = "Map of restrictions values across all apikeys_keys, keyed the same as var.apikeys_keys except keys with no restrictions are omitted"
  value       = { for k, v in google_apikeys_key.apikeys_keys : k => one(v.restrictions) if v.restrictions != null && length(v.restrictions) > 0 }
}
output "apikeys_keys_service_account_email" {
  description = "Map of service_account_email values across all apikeys_keys, keyed the same as var.apikeys_keys except keys with no service_account_email are omitted"
  value       = { for k, v in google_apikeys_key.apikeys_keys : k => v.service_account_email if v.service_account_email != null && length(v.service_account_email) > 0 }
}
output "apikeys_keys_uid" {
  description = "Map of uid values across all apikeys_keys, keyed the same as var.apikeys_keys except keys with no uid are omitted"
  value       = { for k, v in google_apikeys_key.apikeys_keys : k => v.uid if v.uid != null && length(v.uid) > 0 }
}

