resource "aws_iam_role" "lambda_execution_role" {
  name               = "${var.stack_id}-lambda-execution-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_lambda.json
}

resource "aws_iam_policy" "lambda_execution_policy" {
  name   = "${var.stack_id}-lambda-execution-policy"
  policy = data.aws_iam_policy_document.lambda_execution_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_execution_policy_attachment" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_execution_policy.arn
}