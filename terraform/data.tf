data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_iam_policy_document" "assume_role_policy_lambda" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type = "Service"

      identifiers = [
        "lambda.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "lambda_execution_policy" {
  statement {
    effect    = "Allow"
    actions   = [
                  "ec2:CreateNetworkInterface",
                  "ec2:DescribeNetworkInterfaces",
                  "ec2:DeleteNetworkInterface"
                ]
    resources = ["*"]
  }

}

data "aws_ami" "jenkins_image" {
  most_recent = true
  owners = ["self"]
  filter {                       
    name = "name"     
    values = ["jenkins-ami"]
  }                              
}

