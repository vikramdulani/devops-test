output "groups" {
  description = "Create IAM groups"
  value  = aws_iam_group.groups
}

output "users" {
    description = "Created IAM users"
    value = aws_iam_user.users
  
}

output "roles" {
    description = "Created IAM roles"
    value = aws_iam_role.roles
  
}

output "user_group_memberships" {

    description = "Assigned user/group memberships"
    value = aws_iam_user_group_membership.group_membership
  
}

output "group_policy" {

    description = "Created group policy"
    value = aws_iam_group_policy.group_policy
}