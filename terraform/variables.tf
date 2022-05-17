variable "users" {
    type = string
    default = "prod-ci-user"
    description = "List for Terraform create users"
}

variable "groups" {
    type = string
    default = "prod-ci-group"
    description = "List for Terraform create groups"
}

variable "roles" {
    type = string
    default = "prod-ci-role"
    description = "List for Terraform create roles"
}

variable "group_policy" {
    type = string
    default = "prod-ci-policy"
    description = "List for Terraform create group_policy"
}