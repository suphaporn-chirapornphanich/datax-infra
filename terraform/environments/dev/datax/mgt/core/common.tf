locals {
  tags = merge(try(var.tags, {}), var.common_tags)
}
