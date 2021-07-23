# Terraform on AWS Release note
## 2021-07-21 업데이트 내용
EC2, VPC module v1.0 생성 
EC2, VPC module v1.0 수정 (dynamic root_volume, vpc variable 수정)

## 2021-07-22 업데이트 내용
모듈 재조합 (VPC, Security / EC2,EBS)
VPC -> Network module 통합 진행
Network module v1.1 업데이트 (Security 기본 생성 테스트)

## 2021-07-23 업데이트 내용 
Network module v1.1 업데이트 (security groups 재생성/태깅 수정 및 완성)

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