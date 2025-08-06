resource "aws_lb_listener_rule" "this" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    type = var.action_type

    dynamic "redirect" {
      for_each = var.action_type == "redirect" ? [1] : []
      content {
        host        = var.redirect_host
        path        = var.redirect_path
        port        = var.redirect_port
        protocol    = var.redirect_protocol
        status_code = var.redirect_status_code
      }
    }

    dynamic "forward" {
      for_each = var.action_type == "forward" ? [1] : []
      content {
        target_group {
          arn = var.target_group_arn
        }
      }
    }
  }

  dynamic "condition" {
    for_each = var.path_patterns != null ? [var.path_patterns] : []
    content {
      path_pattern {
        values = condition.value
      }
    }
  }

  dynamic "condition" {
    for_each = var.host_headers != null ? [var.host_headers] : []
    content {
      host_header {
        values = condition.value
      }
    }
  }

  tags = var.tags
}
