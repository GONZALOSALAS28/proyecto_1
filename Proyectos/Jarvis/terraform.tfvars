#muestra los valores de contenido  para mi modulo dynamodb

ambiente     = "dev"
nombre-tabla = "jarvis-capacities"
modo-factura = "provisioned"
lecturas     = 5
escrituras   = 5
clave-hash   = "identificacion"
tipo-hash    = "S"
clave-orden  = "secuencia"
tipo-orden   = "N"

# contenido maquina de estado

region_lambda = "us-east-1"
cuenta aws = ""
step function_name = ""
directorio-base = "./lambdas-"
nombre-proyecto = "jarvis"

lambda_crear_repositorio = "crear_repositorio"
handler-para-lambda-1 = "crear-repositorio.lambda_handler"
runtime-para-lambda-1 = "python 3.8"

lambda_inicializar_repo = "inicializar_repo"
handler-para-lambda-2 = "crear-repositorio.lambda_handler"
runtime-para-lambda-2 = "python 3.8"

lambda_modificar_repo = "modificar_repo"
handler-para-lambda-3 = "crear-repositorio.lambda_handler"
runtime-para-lambda-3 = "python 3.8"

lambda_ejecutar_pipeline = "ejecutar_pipeline"
handler-para-lambda-4 = "crear-repositorio.lambda_handler"
runtime-para-lambda-4 = "python 3.8"

lambda_validar_capacidad = "validar_capacidad"
handler-para-lambda-5 = "crear-repositorio.lambda_handler"
runtime-para-lambda-5 = "python 3.8"
