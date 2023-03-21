# Terraform
1) Create Ubuntu EC2 instance (t2.meduim) 
2) Create IAM role with EC2/S3/DynamoDB full access policy attached
3) Attach role to EC2 instance created above. 
4) Install Jenkins on EC2 instance using the link https://www.jenkins.io/doc/book/installing/linux/#debianubuntu
5) Install Terraform on EC2 instance using the link https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
6) Login to Jenkins using public IP of EC2 instance with default port of jenkins 8080
7) Configure Jenkins
      7.1) Manager Jenkins-----> manage Plugins----Terraform-----Install without restart
      
      7.2) Manage Jenkins-------> Global tool configuration----->Terraform---->uncheck auto install----->give name and terrafrom installation dir
      
      7.3) 
