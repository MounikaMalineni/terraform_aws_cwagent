locals {
  userdata = templatefile("user_data.sh", {
    ssm_cloudwatch_config = aws_ssm_parameter.cw_agent.name
  })
}

resource "aws_instance" "this" {
  ami                  = "ami-08cd358d745620807"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.this.name
  user_data            = local.userdata
  tags                 = { Name = "EC2-with-cw-agent" }
}

resource "aws_ssm_parameter" "cw_agent" {
  description = "Cloudwatch agent config to configure custom log"
  name        = "/cloudwatch-agent/config"
  type        = "String"
  value       = file("cw_agent_config.json")
}