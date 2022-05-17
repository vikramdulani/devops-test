## DevOps Home Test

### 1. A Dockerfile to run Energi v3.1.2 in a container.

    docker build -t energi-node .
    docker run -d --name energi-node -v /<localPath>/:/root -p 39796:39796 -p 39797:39797 energi-node

### 2. Kubernets Statefulset to run the above

Create the statefulset

    kubectl apply -f energi-node.yaml

Get the list of running pods

    kubectl get pods

Get the list of running services

    kubectl get services

### 3. CI/CD pipeline for the above

This is a very simple (partial) build and deploy script for 1 & 2

    gitlab-ci.yml

### 4. A Bash script that reads the 'string.json' file and manipulates the text to print email addresses in the "first_name.last_name@domain.com" format

Run the shell script

    bash string.sh

### 5. A NodeJS app that reads the 'string.json' file and manipulates the text to print email addresses in the "first_name.last_name@domain.com" format

Run the node app

    node app.js

### 6. Terraform module that creates a role, a group policy, a group and a user. It allows all members of the group to assume a Role in AWS IAM.

#### Update the variable names in the variables.tf file

#### Configure keys for your AWS account

    export AWS_ACCESS_KEY_ID=""
    export AWS_SECRET_ACCESS_KEY=""

#### Run Terraform module

Initialize terraform

    terraform init

Apply terraform

    terraform apply
