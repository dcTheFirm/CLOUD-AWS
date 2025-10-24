provider "aws" {
  region = "ap-south-1"
}

# IAM Role for EC2
resource "aws_iam_role" "web_server_role" {
  name = "web-server-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy for S3 Access
resource "aws_iam_policy" "s3_web_access" {
  name = "s3-web-access"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListAllMyBuckets",
          "s3:GetObject",
          "s3:PutObject", 
          "s3:ListBucket"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "web_s3_attach" {
  role       = aws_iam_role.web_server_role.name
  policy_arn = aws_iam_policy.s3_web_access.arn
}

# Instance Profile for EC2
resource "aws_iam_instance_profile" "web_profile" {
  name = "web-instance-profile"
  role = aws_iam_role.web_server_role.name
}
