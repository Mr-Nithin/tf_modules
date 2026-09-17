resource "aws_eks_cluster" "this" {
  name                = var.cluster_name
  version             = var.eks_version
  role_arn            = aws_iam_role.this.arn
  deletion_protection = var.deletion_protection

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    subnet_ids              = var.subnet_ids
  }


  depends_on = [aws_iam_role_policy_attachment.this]

}


