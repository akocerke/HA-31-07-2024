resource "aws_lambda_function" "example" {
  filename         = "lambda_function_payload.zip"
  function_name    = "example_function"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "exports.handler"
  runtime          = "nodejs14.x"
  
  # Weitere Konfigurationen...
}


