# 모듈 업데이트 사항 (lastest)
ㄴ 기초 모듈 업데이트 (VPC,EC2,Web,Was,db,bastion,SecurityGroups,Key-pair)
ㄴ 인스턴스 모듈 통합 (Ec2 module[Web,Was,bastion])

# 모듈 업데이트 예정사항
ㄴ sg 모듈 통합 
ㄴ ELB 모듈 통합
ㄴ 타겟 그룹 지정자 수정
ㄴ terragrunt 구성
# Providers
| Name | Version |
|------|---------|
| aws | n/a |

## Modules-docs
profile = AWS profile ( e.g DEV, STG, Prod)
name = AWS user name ( e.g Tom, Dominic, HanseobLee)
### VPC
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | This is Prefix Name | `string` | n/a | yes |
| profile | Seperate DEV, STG, PRD | `string` | n/a | yes |
| vpc\_cidr | Set VPC CIDR | `string` | n/a | yes |

#### Outputs

| Name | Description |
|------|-------------|
| vpc\_cidr\_block | VPC CIDR block |
| vpc\_id | VPC ID |

### subnet  
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| avail\_zones | dokyo Region az | `list` | n/a | yes |
| db\_sub\_cidr | Set Private Subnet CIDR | `list` | n/a | yes |
| name | This is Prefix Name | `string` | n/a | yes |
| pri\_sub\_cidr | Set Private Subnet CIDR | `list` | n/a | yes |
| profile | Seperate DEV, STG, PRD | `string` | n/a | yes |
| pub\_sub\_cidr | Set Public Subnet CIDR | `list` | n/a | yes |
| vpc\_id | n/a | `string` | n/a | yes |

#### Outputs

| Name | Description |
|------|-------------|
| database\_subnets\_ids | Database Subnet ID list |
| igw\_id | Interget Gateway ID |
| nat\_eip\_ids | NAT Gateway EIP id lsit |
| natgw\_ids | NAT Gateway ID list |
| private\_route\_table\_ids | Private Route Table ID list |
| private\_subnets\_ids | Private Subnet ID list |
| public\_route\_table\_ids | Public Route Table ID list |
| public\_subnets\_ids | Public Subnet ID list |

### security groups
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | This is Prefix Securitygroup description | `string` | n/a | yes |
| from\_port | n/a | `string` | n/a | yes |
| name | This is Prefix Name | `string` | n/a | yes |
| profile | Seperate DEV, STG, PRD | `string` | n/a | yes |
| protocol | n/a | `string` | n/a | yes |
| security\_groups | n/a | `list` | n/a | yes |
| sg\_cidr\_blocks | This is Prefix Securitygroup Cidr | `list` | n/a | yes |
| sg\_name | n/a | `string` | n/a | yes |
| to\_port | n/a | `string` | n/a | yes |
| vpc\_id | n/a | `string` | n/a | yes |

#### Outputs

| Name | Description |
|------|-------------|
| sg\_id | output sg id |

### EC2
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| avail\_zones | dokyo Region az | `list` | n/a | yes |
| instance\_type | n/a | `string` | n/a | yes |
| name | This is Prefix Name | `string` | n/a | yes |
| profile | Seperate DEV, STG, PRD | `string` | n/a | yes |
| public\_ip | Set Public IP | `bool` | `false` | no |
| server-name | This is Prefix serverName | `string` | n/a | yes |
| sub\_id | Subnet ID | `list` | n/a | yes |
| vpc\_id | n/a | `string` | n/a | yes |

## Outputs

No output.

### Database

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| avail\_zones | dokyo Region az | `list` | n/a | yes |
| cluster\_identifier | cluster\_identifier setting | `string` | n/a | yes |
| db\_name | dokyo Region az | `string` | n/a | yes |
| db\_port | RDS port | `string` | n/a | yes |
| deletion\_protect | n/a | `bool` | `false` | no |
| engine\_mode | RDS mode setting | `string` | n/a | yes |
| engine\_type | RDS engine\_version | `string` | n/a | yes |
| engine\_version | RDS engine\_version | `string` | n/a | yes |
| name | This is Prefix Name | `string` | n/a | yes |
| password | RDS password setting ! | `string` | n/a | yes |
| profile | Seperate DEV, STG, PRD | `string` | n/a | yes |
| security\_groups | security\_groups setting | `list` | n/a | yes |
| subnets | RDS subnet setting | `list` | n/a | yes |

## Outputs

No output.

### key-pair
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_key\_pair | Controls if key pair should be created | `bool` | `true` | no |
| key\_name | The name for the key pair. | `string` | `null` | no |
| key\_name\_prefix | Creates a unique name beginning with the specified prefix. Conflicts with key\_name. | `string` | `null` | no |
| public\_key | The public key material. | `string` | `""` | no |
| tags | A map of tags to add to key pair resource. | `map(string)` | `{}` | no |

#### Outputs

| Name | Description |
|------|-------------|
| this\_key\_pair\_fingerprint | The MD5 public key fingerprint as specified in section 4 of RFC 4716. |
| this\_key\_pair\_key\_name | The key pair name. |
| this\_key\_pair\_key\_pair\_id | The key pair ID. |
