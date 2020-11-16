# Put provisioner users in the appropriate group
resource "aws_iam_user_group_membership" "provisioner" {
  for_each = { for username, attributes in var.users : username => "" if contains(attributes["roles"], "provisioner") }

  user = aws_iam_user.users[each.key].name

  groups = [
    aws_iam_group.provisioner_users.name
  ]
}