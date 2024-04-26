#POLITICA IAM PARA ROL DE lambda
data "aws_iam_policy_document" "lambda_assume_rol_policy_document"{
    version = "2012-10-17"

    statement {
        sid = "lambdassumerole"
        effect = "allow"
        actions = ["sts:assumerole"]

        principals{
            identifiers = ["lambda.amazonaws.com"]
            type = "service"
        }
    }
}

# CREAR ROL IAM PARA LAMBDA

resource "aws_iam_role" "lambda_assume_role"{
    name = "${var.lambda_crear_repositorio}-assume-role"
    lambda_assume_rol_policy_ = data.aws_iam_policy_document.lambda_assume_rol_policy__document

    lifecycle{
        create_before_destroy=true
    }
}

# DEFINIR POLITICA dynamodb
 data "aws_iam_policy_document" "policy" {
    statement{
        effect = "allow"
        actions = ["dynamodb:*"]
        resource = ["*"]
    }
 }

 resource "aws_iam_policy" "policy"{
    name = "politica-dynamodb-rol-lambda"
    description= "politica para darle permiso a la lambda"
    policy =  aws_iam_policy_document.policy.json
 }

 resource "aws_iam_policy_attachment" "ligar-politica-rol"{
    role = aws_iam_role.lambda_assume_role.name
    policy_arn = aws_iam_policy.policy.arn
 }

 data "aws_iam_policy_attachment" "policy-stepfunctions"{
    statement {
        effect = "allow"
        actions =["states:*"]
        resources = ["*"]
    }
 }

 resource "aws_iam_policy" "policy-stepfunctions"{}
name = "politica-stepfunctions-rol-lambda"
description ="politica para darle permiso a lambda de ejecutar stepfunction"
policy = data.aws_iam_policy_document.policy-stepfunctions".json


resource "aws_iam_policy_attachment" "ligar-politica-stepfunctions"{
    role = aws_iam_role_lambda_assume_role.name
    policy_arn =aws_iam_policy.policy-stepfunctions.arn
}
