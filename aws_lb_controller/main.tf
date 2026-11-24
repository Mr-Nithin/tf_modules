resource "aws_iam_policy" "this" {
  name        = "${var.cluster_name}_AWS_ELB_Policy"
  description = "AWS ELB Policy"
  policy      = file("${path.module}/values/AWS_Load_Balancer_Controller.json")
}

resource "aws_iam_role" "this" {
  name               = "${var.cluster_name}_AWS_ALB_Role"
  description        = "Trust Relationship"
  assume_role_policy = file("${path.module}/values/Pod_Identity_Agent.json")

}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_eks_pod_identity_association" "ebs" {
  cluster_name    = var.cluster_name
  namespace       = "kube-system"
  service_account = "aws-load-balancer-controller"
  role_arn        = aws_iam_role.this.arn
}


resource "helm_release" "this" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version    = var.chart_version

  set = [
    { name = "clusterName", value = var.cluster_name },
    { name = "vpcId", value = var.vpc_id },
    { name = "region", value = var.region },
    { name = "serviceAccount.name", value = "aws-load-balancer-controller" },
  ]

}

