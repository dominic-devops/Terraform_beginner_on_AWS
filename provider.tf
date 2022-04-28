provider "aws" {
  shared_credentials_files = ["C:/Users/lhs/.aws/credentials"] ## windows
#  shared_credentials_files = ["/home/dominic/.aws/credentials"] ## Linux
  profile                 = "infra-test"
  region                  = "ap-northeast-1"
}