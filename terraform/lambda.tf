# resource "aws_lambda_function" "main_lambda" {
#   function_name = "main-lambda"
#   role          = aws_iam_role.lambda_execution_role.arn
#   handler       = "handler.py"
#   runtime = "python3.8"

#   environment {
#     variables = {
#       foo = "bar"
#     }
#   }
# }