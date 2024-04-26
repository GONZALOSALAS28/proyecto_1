module "dynamodb-jarvis" {
  source = "../modulos/aws/database/dynamodb"


 ambiente     = var.ambiente
 nombre-tabla = var.nombre-tabla
 modo-factura = var.modo-factura
 lecturas     = var.lecturas
 escrituras   = var.escrituras
 clave-hash   = var.clave-hash
 tipo-hash    = var.tipo-hash
 clave-orden  = var.clave-orden
 tipo-orden   = var.tipo-orden
}
module "maquina-estado-jarvis"{
    source = "../modulos/aws/appintegration/stepfunctions"

    region_lambda =var.region_lambda
    cuenta_aws = var.cuenta_aws
    step_function_name = var.step_function_name
    directorio-base = var.directorio-base
    nombre-proyecto  = var.nombre-proyecto

 lambda_crear_repositorio  = var.lambda_crear_repositorio
 handler-para-lambda-1 = var.handler-para-lambda-1
 runtime-para-lambda-1 = var.runtime-para-lambda-1

 lambda_inicializar_repositorio  =var.lambda_inicializar_repo
 handler-para-lambda-2 = var.handler-para-lambda-2
 runtime-para-lambda-2 = var.runtime-para-lambda-2

 lambda_modificar_repo  = var.lambda_modificar_repo
 handler-para-lambda-3 = var.handler-para-lambda-3
 runtime-para-lambda-3 = var.runtime-para-lambda-3

 lambda_ejecutar_pipeline  = var.lambda_ejecutar_pipeline
 handler-para-lambda-4 = var.handler-para-lambda-4
 runtime-para-lambda-4 = var.runtime-para-lambda-4

 lambda_validar_capacidad = var.lambda_validar_capacidad
 handler-para-lambda-5 = var.handler-para-lambda-5
 runtime-para-lambda-5 = var.runtime-para-lambda-5
}