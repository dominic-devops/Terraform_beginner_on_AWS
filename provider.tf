provider "aws" {
  shared_credentials_files = ["/Users/dominic/.aws/credentials"]
  profile                 = "infra-test"
  region                  = "ap-northeast-1"
}