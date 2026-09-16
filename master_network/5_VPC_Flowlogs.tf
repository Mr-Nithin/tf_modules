# Role
resource "aws_iam_role" "flow_logs" {
  name = "${var.vpc_name}_FlowLogs_Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "vpc-flow-logs.amazonaws.com" }
    }]
  })
}

# Policy
resource "aws_iam_role_policy" "flow_logs" {
  name = "${var.vpc_name}_FlowLogs_Policy"
  role = aws_iam_role.flow_logs.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ]
      Resource = "*"
    }]
  })
}



resource "aws_flow_log" "this" {
  log_destination_type     = "cloud-watch-logs"
  vpc_id                   = aws_vpc.this.id
  max_aggregation_interval = var.max_aggregation_interval
  traffic_type             = "ALL"
  iam_role_arn             = aws_iam_role.flow_logs.arn
  log_destination          = aws_cloudwatch_log_group.flow_logs.arn
}

resource "aws_cloudwatch_log_group" "flow_logs" {
  name              = "/vpc/flowlogs/${aws_vpc.this.id}"
  retention_in_days = var.flow_logs_retention_days
}