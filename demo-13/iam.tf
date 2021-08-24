# group definition
resource "aws_iam_group" "s3-administrators" {
  name = "s3-administrators"
}

resource "aws_iam_policy_attachment" "s3-administrators-attach" {
  name       = "s3-administrators-attach"
  groups     = [aws_iam_group.s3-administrators.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# user
resource "aws_iam_user" "s3-admin1" {
  name = "s3-admin1"
}

resource "aws_iam_user" "s3-admin2" {
  name = "s3-admin2"
}

resource "aws_iam_group_membership" "s3-administrators-users" {
  name = "s3-administrators-users"
  users = [
    aws_iam_user.s3-admin1.name,
    aws_iam_user.s3-admin2.name,
  ]
  group = aws_iam_group.s3-administrators.name
}

output "warning" {
  value = "WARNING: make sure you're not using the AdministratorAccess policy for other users/groups/roles. If this is the case, don't run terraform destroy, but manually unlink the created resources"
}

