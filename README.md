# Terraform
1) Configure EC2 Instance
      1.1) Create Ubuntu EC2 instance (t2.meduim). 
      1.2) Create IAM role with EC2/S3/DynamoDB full access policy attached.
      1.3) Attach role to EC2 instance created above. 
      1.4) Install java (Jenkins require Java) on EC2 with this command. "sudo apt install openjdk-11-jre"
      1.5) Install Jenkins on EC2 instance using the link https://www.jenkins.io/doc/book/installing/linux/#debianubuntu.
      1.6) Install Terraform on EC2 instance using the link https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
      
2) Configure Jenkins
      2.1) Login to Jenkins using public IP of EC2 instance with default port of jenkins 8080
      2.2) Manager Jenkins-----> Manage Plugins----> search for Terraform-----Install without restart
      2.3) For Jenkins to work with terraform plugin, Terraform binary must be installed. 
            Manage Jenkins-------> Global Tool Configuration----->Terraform---->uncheck auto install----->Provide name and terrafrom install dir (/uer/bin/terraform)
            
3) Prepare and upload Terraform config file on GitHub.
      3.1) upload .tf file to GitHub repo
      3.2) upload Jenkinsfile to GitHub repo
      
4) Create Jenkins Pipeline
   Dashboard---->New Item---->Select Pipeline---->GitHub Project--->Provide GitHub repo URL---->Check This project is Parameterized---->Choice parameter-------           ------> Name: action & Parameter: apply   destroy (on separate line)----> 

5) Configure Access to AWS
      5.1) if Jenkins is hosted on EC2 instance within AWS, Use IAM Role (as created on 1.2)
      5.2) if Jenkins is not hosted on AWS, use AWS CLI (AWS configure) or plugins (jenkins credential manager)   
       
6) Create S3 bucket (region us-east-1) and DynamoDB in AWS for remote state file/state locking
      6.1) Create S3 Bucket with bucket name as mentioned on backend.tf in us-east region (bucket name=terraformbackendbucket2023)
      6.2) Create DynamoDB table with Table name as mentioned on backend.tf (table name=dynamodb-state-locking) with Partition key=LockID Type=String
            
7) Test Pipeline
      7.1) Jenkins Dashboard---->Build with parameter---->choose Apply
      7.2) This should create ubuntu EC2 instance in AWS us-east-region with state file (terrafrom.ftstate) on S3 bucket created on 6.1. 
      
8) Destroy resources 
      8.1) Jenkins Dashboard---->Build with parameter---->choose Destroy
      8.2) This should destroy ubuntu EC2 instance in AWS us-east-region.
      
9) Trigger pipeline automatic
      9.1) Via Webhooks  {GitHub Repo---Settings----webhooks---add webhook---Payload URL: JenkinsURL/github-webhook/ 
      9.2) Via Poll SCM  {* * * * *} 

