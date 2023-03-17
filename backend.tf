terraform {
    backend "s3" {
        bucket = "terraformbackendbucket2023"
        key    = "backend/s3/terraform.tfstate"
        region     = "us-east-1"
       }
} 

