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
      subnet_id                   = module.network.public_subnets_ids[0]
      private_ip                  = {"private cidr 입력"}
      instance_type               = {"인스턴스 타입 입력"}
      associate_public_ip_address = {"public ip 활성화 여부 [ture/false]"}
      root_block_device           = [{ volume_size = {"GB 입력"}, volume_type = {"EBS 타입 입력"} }]
```
### EC2 module Output
```
Instance id | Instanec type | private IP | public IP
```
### Network module Input
1. 통합 variable 내 프로젝트 정의 [variable.tf 참고]
```
    {SG 명 입력} = {
        ingress = {
            {Type 입력} = {
            protocol = {"protocol 입력"}
            from_port = {"port_range 입력"}
            to_port   = {"port_range 입력"}
            cidr_blocks = ["Cidr 대역 입력",]
            }
        }
        egress = {
            {Type 입력} = {
            protocol = {"protocol 입력"}
            from_port = {"port_range 입력"}
            to_port   = {"port_range 입력"}
            cidr_blocks = ["Cidr 대역 입력",]
            }
        }
    }
```