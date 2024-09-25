output "vpc_id" {
    description     =   "The ID of VPC"
    value           =   module.vpc.this_vpc_id
}

output "vpc_cidr_block" {
    description     =   "The CIDR IP Range Block of VPC"
    value           =   module.vpc.this_vpc_cidr_block
}

output "public_subnet_ids" {
    description     =   "The List of Public Subnet ID of VPC"
    value           =   module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
    description     =   "The List of Private Subnet ID of VPC"
    value           =   module.vpc.private_subnet_ids
}

output "admin_security_group_id" {
    description     =   "The ID of Security Group for Admin access"
    value           =   module.vpc.admin_security_group_id
}

output "alb_security_group_id" {
    description     =   "The ID of Security Group for ALB"
    value           =   module.vpc.alb_security_group_id
}

output "web_security_group_id" {
    description     =   "The ID of Security Group for Web(HTTP) access from ALB"
    value           =   module.vpc.web_security_group_id
}

output "web_alb_arn" {
    description     =   "The ARN of ALB"
    value           =   module.load_balancer.web_alb_arn
}

output "web_alb_name" {
    description     =   "The name of ALB"
    value           =   module.load_balancer.web_alb_name
}

output "web_alb_dns_name" {
    description     =   "The DNS name of ALB"
    value           =   module.load_balancer.web_alb_dns_name
}

output "web_auto_scaling_group_id" {
    description     =   "The ID of Auto Scaling Group"
    value           =   module.auto_scaling_group.web_auto_scaling_group_id
}

output "web_launch_template_id" {
    description     =   "The ID of Launch Template"
    value           =   module.auto_scaling_group.web_launch_template_id
}
