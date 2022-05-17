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

resource "aws_iam_role" "roles" {

    name = var.users

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
            "Resource": ["arn:aws:iam::947860202749:group/prod-ci-group"]
        },
        ]
    })
  
}

resource "aws_iam_user_group_membership" "group_membership" {

    user = aws_iam_user.users.name

    groups = [
        aws_iam_group.groups.name
    ]
}

resource "aws_iam_user" "users" {
    name = var.users
    path = "/"
  
}

resource "aws_iam_group" "groups" {
    name = var.groups
    path = "/"
  
}

