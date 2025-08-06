variable "listener_arn" {
  description = "ALB listener ARN"
  type        = string
}

variable "priority" {
  description = "Listener rule priority"
  type        = number
}

variable "action_type" {
  description = "Action type (redirect or forward)"
  type        = string
}

variable "redirect_host" {
  description = "Redirect target host"
  type        = string
  default     = ""
}

variable "redirect_path" {
  description = "Redirect path"
  type        = string
  default     = ""
}

variable "redirect_port" {
  description = "Redirect port"
  type        = string
  default     = "443"
}

variable "redirect_protocol" {
  description = "Redirect protocol"
  type        = string
  default     = "HTTPS"
}

variable "redirect_status_code" {
  description = "Redirect status code"
  type        = string
  default     = "HTTP_302"
}

variable "target_group_arn" {
  description = "Target group ARN (required for forward action)"
  type        = string
  default     = ""
}

variable "path_patterns" {
  description = "Applicable URL patterns"
  type        = list(string)
}

variable "host_headers" {
  description = "Applicable host headers"
  type        = list(string)
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}
