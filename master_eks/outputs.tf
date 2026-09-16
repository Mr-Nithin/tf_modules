output "eks_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.this.name
}

output "openid_provider_arn" {
  description = "ARN of OIDC"
  value       = aws_iam_openid_connect_provider.this[0].arn
}

output "eks_URL" {
  description = "URL to access your EKS cluster"
  value       = "https://${data.aws_region.current.region}.console.aws.amazon.com/eks/clusters/${var.cluster_name}?region=${data.aws_region.current.region}"
}

data "aws_region" "current" {}
