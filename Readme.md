# Terraform on AWS Release note
## Terraform Version ## 
Terraform v1.0.8
aws v3.61.0
### 사용 방법
1. AWS IAM console 내 Terraform 용 계정 Access/Secret Key 발급
2. .aws/credentials 내 추가 후 [provider.tf] 경로 수정 필요
ㄴ 프로필 별 설정 가능
3. terraform init을 통해 모듈 불러온 뒤, terrafrom plan으로 구성 확인 후, apply로 동작확인

### EC2 module Input
```
    {인스턴스 명} = {
      image                       = {"ami-id 입력"}
      subnet_id                   = module.network.{public/private}_subnets_ids[{0,1,2,3...variable 참고}]
      private_ip                  = {"private cidr 입력"}
      instance_type               = {"인스턴스 타입 입력"}
      associate_public_ip_address = {"public ip 활성화 여부 [ture/false]"}
      root_block_device           = [{ volume_size = {"GB 입력"}, volume_type = {"EBS 타입 입력"} }]
```
### EC2 module Output
```
1.ec2_info
Instance id | Instanec type | private IP | public IP

2.private_subnet_info
Subnet_Cidr | AZ

3.public_subnet_info
Subnet_Cidr | AZ
```
### Network module Input
