resource "aws_autoscaling_group" "my_asg1" {
  vpc_zone_identifier = var.vpc_zone_identifier
#  availability_zones = ["ap-south-1a"]
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  target_group_arns  = var.target_group_arns
  launch_template {
    id      = var.launch_template
    version = "$Latest"
  }
  # tags = {
  # #  Name = "tf-web_asg",
  #   Kind = "practice"
  # }
}

# Auto Scaling Group for web server instances
resource "aws_autoscaling_group" "web_asg" {
  name                      = "web-asg"
  launch_configuration     = aws_launch_configuration.web_lc.name
  min_size                  = 2
  max_size                  = 4
  desired_capacity          = 2
  vpc_zone_identifier       = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  target_group_arns         = [aws_lb_target_group.web_target_group.arn]
  health_check_type         = "ELB"

  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }
}