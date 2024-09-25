resource "aws_autoscaling_group" "K8sworker" {
    name                         =    "${var.prefix}-K8sworker-ASG"
    vpc_zone_identifier          =    var.subnet_ids
    max_size                     =    var.max_size	
    min_size                     =    var.min_size
    desired_capacity             =    var.desired_capacity
    target_group_arns            =    var.target_group_arns

    health_check_type            =    "ELB"
        
    launch_template {
        id         =     aws_launch_template.web.id
        version    =     "$Default"
    }
}

resource "aws_autoscaling_policy" "K8sworker" {
  name                   = "K8sworker"
  policy_type           =   "TargetTrackingScaling"

  autoscaling_group_name = aws_autoscaling_group.K8sworker.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 30.0
  }
}

  
