# DevOps Home Test

## A Dockerfile to run Energi v3.1.2 in a container.

**[Usage]**

    docker build -t energi-node .
    docker run -d --name energi -v /<localPath>/:/root -p 39796:39796 -p 39797:39797 energi

## Kubernets Statefulset to run the above

**[Usage]**

Create the statefulset

    kubectl apply -f energi-node.yaml

Get the list of running pods

    kubectl get pods

Get the list of running services

    kubectl get service -l app=energi

## CI/CD pipeline for the above

## A Bash script that reads the 'string.json' file and manipulates the text to print email addresses in the "first_name.last_name@domain.com" format

**[Usage]**

Run the shell script

bash string.sh

## A NodeJS app that reads the 'string.json' file and manipulates the text to print email addresses in the "first_name.last_name@domain.com" format

**[Usage]**

Run the node app

    node app.js

## Terraform module that creates a role, a group policy, a group and a user. It allows all members of the group to assume a Role in AWS IAM.

**[Usage]**

### Update the variable names in the variables.tf file

### Configure keys for your AWS account

$ export AWS_ACCESS_KEY_ID=""
$ export AWS_SECRET_ACCESS_KEY=""

### Run Terraform module

$ terraform init
$ terraform apply
