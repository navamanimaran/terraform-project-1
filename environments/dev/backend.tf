terraform {
  backend "s3" {
    bucket         = "ci-cd-infra-pipeline-state-bucket-org-123"
    region         = "us-west-1"
    key            = "production/terraform.tfstate"
    dynamodb_table = "terraform_state_locks"
    encrypt        = true
  }
}
