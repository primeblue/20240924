# Step

## 1. 변수 설정
auto_scaling_group.tfvars 파일 확인 
실행 환경에 맞게 변경  

```
# auto_scaling_group.tfvars 파일

prefix              =       "user**"
region              =       "ap-northeast-2"
vpc_cidr            =       "10.*.0.0/16"

public_subnets      =       [
    {cidr = "10.**.1.0/24", availability_zone = "ap-northeast-2a"},
    {cidr = "10.*.3.0/24", availability_zone = "ap-northeast-2c"},
    ]

private_subnets = [
    {cidr = "10.*.11.0/24", availability_zone = "ap-northeast-2a"},
    {cidr = "10.*.13.0/24", availability_zone = "ap-northeast-2c"},
]

keypair_name            =       "<<YOUR_KEYPAIR_NAME>>"

```

* Prefix 는 알맞게 변경
* Region 은 본인이 사용할 region 코드로 변경
* Subnet 의 Availability Zone 값은 Region 에 맞게 변경
* admin access CIDR : SSH 접속 허용할 IP 값 변경 
* AMI ID: 기존 08-ec2 챕터에서 생성한 AMI 의 ID
* Data Volume Snapshot ID: 기존 08-ec2 챕터에서 생성한 Data Volume 의 스냅샷 ID
* EC2 instance 에 설정할 keypair 명 설정
* ALB 에서 Instance 로 서비스될 트래픽의 포트(80)와 프로토콜(HTTP)

## 2. init  
Init 명령으로 Terraform 수행을 위한 provider plugin 초기화 및 다운로드 수행

```
terraform init
```

## 3. plan  
Plan 명령으로 Terraform 수행 전 실행 시뮬레이션 확인
```
terraform plan --var-file=auto_scaling_group.tfvars
```  

## 4. apply  
Apply 명령으로 Terraform 을 통한 Resource 생성 수행
```
terraform apply --var-file=auto_scaling_group.tfvars
```  

## 5. 실행 내용 확인
선택한 Region 에 VPC, Subnet, Internet Gateway, Route Table, NAT Gateway, Security Group, instance 생성 내용 확인.    
Auto Scaling Group 확인.  
생성된 ALB 와 Target Group 확인. Target Group 에 소속된 Instance 의 Status Healty 확인.  
ALB 의 DNS name 으로 웹브라우저 접속 정상 확인.  
웹브라우저 refresh 시, 정상적인 Balancing 접속 확인.  


# Resource 삭제

## 1. destroy
Destroy 명령으로 생성된 Auto Scaling Group, ALB 및 VPC 삭제 수행
```
terraform destroy --var-file=auto_scaling_group.tfvars
```
