resource "aws_efs_file_system" "this" {
  creation_token   = var.creation_token
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode
  encrypted        = true
  lifecycle_policy {
    transition_to_ia = var.transition_to_ia
  }

}

