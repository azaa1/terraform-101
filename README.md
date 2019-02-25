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

4. Create a S3 bucket. Take a note on the name and region of the bucket. 

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

  * Run : ssh-keygen
  
  -This will generate SSH key.
  
  * Run : cat ~/.ssh/id_rsa.pub
  
  -Copy the output, save it in AWS Keys, name the key : test-key
  
  -Note : the has to be saved in the Region where you want your resource to be created.
   
  * Run : sudo wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip
  
  -This will get the official .zip file from www.terraform.io , the specific version v0.11.11
  
  * Run : sudo unzip terraform_0.11.11_linux_amd64.zip
  
  -This will unzip the file. 
  
  * Run: sudo mv terraform  /bin/
  
  -This will move terraform to /bin/ folder. 
  
  * Run : terraform -verion 
  
  -The output should be:  Terraform v0.11.11


#### 2. How to use Terraform. 

* Create a directory to setup your workspace. 

   * Make sure git is installed : sudo yum install git 

   * Clone this repository : git clone https://github.com/azaa1/terraform-101.git
   
   * Some terraform commands: 
   
   - terraform init           -Initialize a Terraform working directory

   - terraform plan           -Generate and show an execution plan 

   - terraform apply          -Builds or changes infrastructure
   
   - terraform destroy        -Destroy Terraform-managed infrastructure
   
   - terraform show           -Inspect Terraform state or plan
   
   - terraform  fmt           -Rewrites config files to canonical format 
   
   - terraform validate       -Validates the Terraform files


  #### 3. Modify the files. 
  
  #####  * Note: You need to modify the following files before you run 'terraform init'
            
            - on provider.tf file 
            
                  * region =  change this line to the region where you want to create your resources. 
                  * bucket =  name of your bucket
                  * region =  the region where you created your bucket
   
   #### 4. What do the files do? 
   
  * provider.tf   - This file tells Terraform which provider you are using, and in which region the resources to create. 
                  
                  * NOTE: by default terraform saves the terraform.state file on the directory your working directory. 
                  
                  The 'backend' section instructs terraform to save the file in S3 bucket. 
  
  * user.tf       - Creates a user named 'test-user'
  
  * group.tf      - Creates a group named 'developers'
  
  * instance.tf   - Creates an EC2-Instance, and saves the key 'test-key' for ssh purpose. 

                     * NOTE: you need to change the 'ami' based on your need. 
                  
  * null-resource.tf
   
   #### 5. Create Resources on AWS. 

*  First you need to initialize Terraform
   
   * Run : terraform init
   
   -This will read all the .tf files in the directory. 
   
   * Run : terraform plan 
   
   -This will show you an output of the plan Terraform. Its just a plan. 
   
   * Run : terraform apply 
   
   -This will execute the plan. Confirm the resources are created, check your AWS Console with the specific region. 
