# terraform-101
#### Introduction to Terraform

This repository is an introduction to Terraform. 

#### What is Terraform? 

***Terraform*** is a Infrastructure as a Code (IaaC) tool. It's a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

For this example we are using AWS-EC2 Instance to install Terraform. And the files also manage AWS Resources. 

Prerequisite on AWS Account:

1. IAM Role with AdministrativeAccess.

2. EC2-Instance, CentOS7, Type-t2.micro, with the Role attached to it. 

3. Also generate SSH key on the EC2-Instance. 

NOTE: The above is not recommended for real environment. This is just to practice with Terraform. 


### Objective of this lesson: 

1. Setup Terraform.

2. How to use Terraform. 

3. Create Resources on AWS : user , group , ec2-instance. 

4. How to save the *terraform.tfstate* file in S3 bucket. 

5. How to delete the resources.


### Steps 

#### 1. Setup Terraform 

- SSH to your EC2-Instance
   
  * Run : wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip
  



  
