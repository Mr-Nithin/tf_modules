resource "aws_eks_addon" "secrets_store_csi_driver" {
  cluster_name = var.cluster_name
  addon_name = "aws-secrets-store-csi-driver-provider"
  addon_version = var.addon_version
}

