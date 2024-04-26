


module "subir-lambdas" {
  source             = "../../services/subirlambdas"
  region_lambda      = var.region_lambda
  cuenta_aws         = var.cuentas_aws
  directorio-base    = var.directorio-base
  nombre-proyecto    = var.nombre-proyecto
  
  lambda_crear_repositorio      = var.lambda_crear_repositorio
  handler-para-lambda-1         = var.handler-para-lambda-1
  runtime-para-lambda-1         = var.runtime-para-lambda-1
  
  lambda_inicializar_repo       = var.lambda_inicializar_repositorio
  handler-para-lambda-2         = var.handler-para-lambda-2
  runtime-para-lambda-2         = var.runtime-para-lambda-2

  lambda_modificar_repositorio  = var.lambda_modificar_repositorio
  handler-para-lambda-3         = var.handler-para-lambda-3
  runtime-para-lambda-3         = var.runtime-para-lambda-3

  lambda_ejecutar_pipeline      = var.lambda_ejecutar_pipeline
  handler-para-lambda-4         = var.handler-para-lambda-4
  runtime-para-lambda-4         = var.runtime-para-lambda-4

  lambda_validar_capacidad      = var.lambda_validar_capacidad
  handler-para-lambda-5         = var.handler-para-lambda-5
  runtime-para-lambda-5         = var.runtime-para-lambda-5
}

resource "aws_iam_role" "step_function_role" {
  name = "${var.step_function_role}"
  assume_role_policy = <<-EOF
    {
        "version": "2012-10-17",
        "statement" : [
            {
                "action" : "sts:assumerole",
                "Principal" : {
                    "service" : "states.amazonaws.com"
                },
                "effect" : "allow" ,
                "sid" : "stepfunctionrole"
            }
        ]
    }
  EOF
}

resource "aws_iam_role_policy" "step_function_policy" {
  name = "${var.step_function_name}-policy"
  role = aws_iam_role_step_function_role.id

  policy = <<-EOF
    {
         "version": "2012-10-17",
         "statement": [
          {
            "action": [
                "lambda:invokefunction"
            ],
            "effect": "allow",
            "resource": [
                "${module.subir-lambdas.arn-lambdas-1}",
                "${module.subir-lambdas.arn-lambdas-2}",
                "${module.subir-lambdas.arn-lambdas-3}",
                "${module.subir-lambdas.arn-lambdas-4}",
                "${module.subir-lambdas.arn-lambdas-5}"
            ]
          }
         ]
    }
  EOFS
}


resource "aws_sfn_state_machine" "sfn_state_machine" {
    name =var.step_function_name
    role_arn = aws_iam_role_step_function_role.arn
    definition = <<EOF
    {
        "comment" : "implementacion  del paso a paso  de setp function para el proyecto jarvis.",
        "startat" : "crear repositorio" , 
        "states" : {
            "crear repositorio" {
                "type" : "task" 
                "resource" : "arn:aws:lambda:${var.region_lambda}:${var..cuenta_aws}:function"${var.lambda_crear_repositorio}",
                "next" : "inicializar_repo"
            }, 
                "inicializar_repo" {
                "type" : "task" 
                "resource" : "arn:aws:lambda:${var.region_lambda}:${var..cuenta_aws}:function"${var.lambda_inicializar_repo}",
                "next" : "modificar_repo"
            }, 
                "modificar_repo" {
                "type" : "task" 
                "resource" : "arn:aws:lambda:${var.region_lambda}:${var..cuenta_aws}:function"${var.modificar_repo}",
                "next" : "lambda_ejecutar_pipeline"
            },
                "ejecutar_pipeline" {
                "type" : "task" 
                "resource" : "arn:aws:lambda:${var.region_lambda}:${var..cuenta_aws}:function"${var.ejecutar_pipeline}", 
                "next" : "validar_capacidad"
            }, 
                "validar_capacidad" {
                "type" : "task" 
                                "resource" : "arn:aws:lambda:${var.region_lambda}:${var..cuenta_aws}:function"${var.validar_capacidad}",

                "end" : "true"
            }

        }
    
    }
    EOF
}
