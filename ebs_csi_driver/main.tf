resource "aws_iam_policy" "this" {
  name = "${var.cluster_name}_EBS_Driver_Policy"
  description = "EBS driver policy"
  policy = file("${path.module}/values/AmazonEBSCSIDriverPolicyV2.json")
}

resource "aws_iam_role" "this" {
  name = "${var.cluster_name}_PIA_Role"
  description = "Trust relationship"
  assume_role_policy = file("${path.module}/values/Pod_Identity_Agent.json")
}

resource "aws_iam_role_policy_attachment" "this" {
  role = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_eks_pod_identity_association" "ebs" {
  cluster_name = var.cluster_name
  namespace = "kube-system"
  service_account = "ebs-csi-controller-sa"
  role_arn = aws_iam_role.this.arn
}

resource "aws_eks_addon" "pod_identity_agent" {
  cluster_name = var.cluster_name 
  addon_name = "aws-ebs-csi-driver"
  addon_version = var.addon_version 
}


