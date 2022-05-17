terraform {

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }

    required_version = ">= 0.14.9"
}

provider "aws" {

    profile = "default"
    region = "me-south-1"
}

# Ceate a resource for IAM Roles and attach it to the trust policy

resource "aws_iam_role" "roles" {

    name = var.roles

    assume_role_policy = jsonencode ({

        Version = "2012-10-17"
        Statement = [
       {     
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid    = ""
            Principal = {
                AWS = ["arn:aws:iam::947860202749:root"]
            }
        
        },
        ]
    })
  
}

# Ceate a resource for IAM Group Policy and attach it to the Role

resource "aws_iam_group_policy" "group_policy" {


    name = var.group_policy
    group = aws_iam_group.groups.name

    policy = jsonencode ({

        Version = "2012-10-17"
        Statement = [
       {     
            Sid = ""
            Action = ["sts:AssumeRole"]
            Effect = "Allow"
            "Resource": ["arn:aws:iam::947860202749:role/prod-ci-role"]
        },
        ]
    })
  
}

# Ceate a resource for IAM Group Membership

resource "aws_iam_user_group_membership" "group_membership" {

    user = aws_iam_user.users.name

    groups = [
        aws_iam_group.groups.name
    ]
}

# Ceate a resource for IAM Users and attach it to the group

resource "aws_iam_user" "users" {
    name = var.users
    path = "/"
  
}

# Ceate a resource for IAM Groups

resource "aws_iam_group" "groups" {
    name = var.groups
    path = "/"
  
}

