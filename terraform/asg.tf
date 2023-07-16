# Auto Scaling Group for web instances
resource "aws_autoscaling_group" "web_asg" {
  name                      = "web-asg"
  launch_configuration     = aws_launch_configuration.web_lc.name
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired_capacity
  vpc_zone_identifier       = aws_subnet.public_subnet[*].id
  health_check_type         = "ELB"
  load_balancers            = [aws_lb.alb]

  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }
}
# Auto Scaling Group for app instances
resource "aws_autoscaling_group" "app_asg" {
  name                      = "app-asg"
  launch_configuration     = aws_launch_configuration.app_lc.name
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired_capacity
  vpc_zone_identifier       = aws_subnet.private_subnet[*].id
  health_check_type         = "ELB"
  load_balancers            = [aws_lb.ilb.arn]

  tag {
    key                 = "Name"
    value               = "app-server"
    propagate_at_launch = true
  }
}