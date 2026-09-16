resource "aws_iam_role" "this" {
  name               = "${var.cluster_name}_EKS_Cluster_Role"
  assume_role_policy = file("${path.module}/values/eks_trust_policy.json")
}

resource "aws_iam_policy" "this" {
  name   = "${var.cluster_name}_EKS_Cluster_Policy"
  policy = file("${path.module}/values/eks_cluster_policy.json")
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}


