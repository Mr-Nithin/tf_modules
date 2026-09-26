resource "aws_iam_role" "ebs_csi_driver" {
  count = var.enable_csi_driver ? 1 : 0
  name  = "${var.cluster_name}_ebs_csi_driver"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "pods.eks.amazonaws.com" }
        Action    = ["sts:AssumeRole", "sts:TagSession"]
      }
    ]
  })
}

resource "aws_iam_policy" "ebs_csi_driver" {
  count  = var.enable_csi_driver ? 1 : 0
  name   = "${var.cluster_name}_ebs_csi_driver_policy"
  policy = file("${path.module}/values/ebs_csi_driver_policy.json")
}

resource "aws_iam_policy" "ebs_csi_driver_encryption" {
  count = var.enable_csi_driver ? 1 : 0
  name  = "${var.cluster_name}_ebs_csi_driver_encryption_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "kms:Decrypt",
          "kms:GenerateDataKeyWithoutPlaintext",
          "kms:CreateGrant"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ebs_csi_driver" {
  count      = var.enable_csi_driver ? 1 : 0
  role       = aws_iam_role.ebs_csi_driver[0].name
  policy_arn = aws_iam_policy.ebs_csi_driver[0].arn
}

resource "aws_iam_role_policy_attachment" "ebs_csi_driver_encryption" {
  count      = var.enable_csi_driver ? 1 : 0
  role       = aws_iam_role.ebs_csi_driver[0].name
  policy_arn = aws_iam_policy.ebs_csi_driver_encryption[0].arn
}

resource "aws_eks_pod_identity_association" "ebs_csi_driver" {
  cluster_name    = var.cluster_name
  namespace       = "kube-system"
  service_account = "ebs-csi-controller-sa"
  role_arn        = aws_iam_role.ebs_csi_driver.arn
}

# CMD to get the latest version 
# aws eks describe-addon-versions --region us-east-1 --addon-name aws-ebs-csi-driver --output yaml
resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name             = var.cluster_name
  addon_name               = "aws-ebs-csi-driver"
  addon_version            = "v1.66.0-eksbuild.1"
  service_account_role_arn = aws_iam_role.ebs_csi_driver.arn
}