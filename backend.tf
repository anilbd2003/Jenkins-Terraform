terraform {
    backend "s3" {
        bucket = "terraform-state-lock-bucket-2023"
        key    = "backend/s3/terraform.tfstate"
        region     = "us-east-1"
        profile = "custom"
       dynamodb_table  = "dynamodb-state-locking"
    }
} 

