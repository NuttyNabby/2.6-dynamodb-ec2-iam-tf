# Define the IAM policy document
resource "aws_iam_policy" "nabilah_dynamodb_policy" {
  name        = "DynamoDBTableAccessPolicy"
  description = "Policy to grant specific permissions to a DynamoDB table and its indexes"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "DynamoDBTableAccess"
        Effect   = "Allow"
        Action   = [
          "dynamodb:BatchGetItem",
          "dynamodb:BatchWriteItem",
          "dynamodb:ConditionCheckItem",
          "dynamodb:PutItem",
          "dynamodb:DescribeTable",
          "dynamodb:DeleteItem",
          "dynamodb:GetItem",
          "dynamodb:Scan",
          "dynamodb:Query",
          "dynamodb:UpdateItem"
        ]
        Resource = [
          "arn:aws:dynamodb:${var.region}:${var.account_id}:table/${var.table_name}",
          "arn:aws:dynamodb:${var.region}:${var.account_id}:table/${var.table_name}/index/*"
        ]
      }
    ]
  })
}

# Define the IAM role
resource "aws_iam_role" "nabilah_dynamodb_read_role" {
  name = "nabilah_dynamodb_read_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the policy to the IAM role
resource "aws_iam_role_policy_attachment" "dynamodb_read_attachment" {
  role       = aws_iam_role.nabilah_dynamodb_read_role.name
  policy_arn = aws_iam_policy.nabilah_dynamodb_policy.arn
}

resource "aws_iam_instance_profile" "nabilah_dynamodb_read_profile" {
  name = "nabilah_dynamodb_read_profile"
  role = aws_iam_role.nabilah_dynamodb_read_role.name
}
