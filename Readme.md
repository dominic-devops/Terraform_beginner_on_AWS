## Terraform Version ## 
Terraform v1.0.8
aws v3.61.0
### 사용 방법
1. AWS IAM console 내 Terraform 용 계정 Access/Secret Key 발급
2. .aws/credentials 내 추가 후 [provider.tf] 경로 수정 필요
ㄴ 프로필 별 설정 가능
3. terraform init을 통해 모듈 불러온 뒤, terrafrom plan으로 구성 확인 후, apply로 동작확인
4. EC2 프로비저닝 전, 콘솔에서 key-pair 생성 후 [variable.tf] 수정 필요
### 초기환경 셋팅
```
# Set Enviroment
variable "profile" {
  default = {
    account    = "XXXXXXXXXXX" ##change
    kname      = "AWS-테라폼테스트" ##change
    publishing = "XXX" ##change
    team       = "인프라서비스팀" ##change
    admin      = "Dominic" ## change
    env        = "DEV"  ## change
  }
}
variable "vpc_name" {
  description = "Set VPC NAME"
  default     = "terraform" ##change
}
variable "vpc_cidr" {
  description = "Set VPC CIDR"
  default     = "10.0.0.0/16" ##change
}
variable "avail_zones" {
  type    = list(any)
  default = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1a"] ##change
}
variable "public_subnet" {
  type    = list(any)
  default = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"] ##change
}
variable "private_subnet" {
  type    = list(any)
  default = ["10.0.20.0/24", "10.0.21.0/24", "10.0.22.0/24"] ##change
}
variable "key_name" {
  type    = string
  default = "terraform" ##change
}
```

### EC2 module Input
```
    {인스턴스 명} = {
      image                       = {"ami-id 입력"} ## change
      subnet_id                   = module.network.{public/private}_subnets_ids[{0,1,2,3...variable 참고}] ## change
      private_ip                  = {"private cidr 입력"} ## change
      instance_type               = {"인스턴스 타입 입력"} ## change
      associate_public_ip_address = {"public ip 활성화 여부 [ture/false]"} ## change
      root_block_device           = [{ volume_size = {"GB 입력"}, volume_type = {"EBS 타입 입력"} }] ## change
```
### EC2 module Output
1.ec2_info : 
Instance id | Instanec type | private IP | public IP

2.private_subnet_info : 
Subnet_Cidr | AZ

3.public_subnet_info : 
Subnet_Cidr | AZ

```
ec2_info = [
  "i-05f81e58f65cc30f3, t2.micro, 10.0.20.11, ",
  "i-0be1b4d1d55420f57, t2.micro, 10.0.10.11, ",
]
private_subnet_info = [
  "10.0.20.0/24,ap-northeast-1a",
  "10.0.21.0/24,ap-northeast-1c",
  "10.0.22.0/24,ap-northeast-1a",
]
public_subnet_info = [
  "10.0.10.0/24,ap-northeast-1a",
  "10.0.11.0/24,ap-northeast-1c",
  "10.0.12.0/24,ap-northeast-1a",
]
```
### Network module Input
