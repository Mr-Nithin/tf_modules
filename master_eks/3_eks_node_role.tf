resource "aws_iam_role" "node" {
  name               = "${var.cluster_name}_Worker_Node_Role"
  assume_role_policy = file("${path.module}/values/node-role-trust-relationship.json")
}

resource "aws_iam_policy" "worker" {
  name   = "${var.cluster_name}_Worker_Node_Policy"
  policy = file("${path.module}/values/AmazonEKSWorkerNodePolicy.json")
}

resource "aws_iam_policy" "cni" {
  name   = "${var.cluster_name}_CNI_Policy"
  policy = file("${path.module}/values/AmazonEKS_CNI_Policy.json")
}

resource "aws_iam_policy" "ecr" {
  name   = "${var.cluster_name}_ECR_Policy"
  policy = file("${path.module}/values/AmazonEC2ContainerRegistryReadOnly.json")
}


resource "aws_iam_role_policy_attachment" "worker" {
  role       = aws_iam_role.node.name
  policy_arn = aws_iam_policy.worker.arn
}

resource "aws_iam_role_policy_attachment" "cni" {
  role       = aws_iam_role.node.name
  policy_arn = aws_iam_policy.cni.arn
}

resource "aws_iam_role_policy_attachment" "ecr" {
  role       = aws_iam_role.node.name
  policy_arn = aws_iam_policy.ecr.arn
}

