module "roles-y-politicas" {
  source = "../../security/rolespoliticas"

  lambda_crear_repositorio    = var.lambda_crear_repositorio
  lambda_inicializar_repo     = var.lambda_inicializar_repositorio
  lambda_modificar_repositorio = var.lambda_modificar_repositorio
  lambda_validar_capacidad    = var.lambda_validar_capacidad
}

# comprimir lambda 1 
data "archive_file" "lambda_zip_file_1" {
  output_path = "${var.directorio-base}${var.nombre-proyecto}/zip/${var.lambda_crear_repositorio}.zip"
  source_dir  = "${var.directorio-base}${var.nombre-proyecto}/${var.lambda_crear_repositorio}"
  excludes    = ["__init__.py", "*.pyc"]
  type        = "zip"
}

# subir la función lambda 1
resource "aws_lambda_function" "lambda_crear_repositorio" {
  function_name     = var.lambda_crear_repositorio
  filename          = data.archive_file.lambda_zip_file_1.output_path
  source_code_hash  = data.archive_file.lambda_zip_file_1.output_base64sha256
  handler           = var.handler-para-lambda-1
  role              = module.roles-y-politicas.asume-rol
  runtime           = var.runtime-para-lambda-1

  lifecycle {
    create_before_destroy = true
  }
}

# comprimir lambda 2
data "archive_file" "lambda_zip_file_2" {
  output_path = "${var.directorio-base}${var.nombre-proyecto}/zip/${var.lambda_inicializar_repositorio}.zip"
  source_dir  = "${var.directorio-base}${var.nombre-proyecto}/${var.lambda_inicializar_repositorio}"
  excludes    = ["__init__.py", "*.pyc"]
  type        = "zip"
}

# subir la función lambda 2
resource "aws_lambda_function" "lambda_inicializar_repositorio" {
  function_name     = var.lambda_inicializar_repositorio
  filename          = data.archive_file.lambda_zip_file_2.output_path
  source_code_hash  = data.archive_file.lambda_zip_file_2.output_base64sha256
  handler           = var.handler-para-lambda-2
  role              = module.roles-y-politicas.asume-rol
  runtime           = var.runtime-para-lambda-2

  lifecycle {
    create_before_destroy = true
  }
}

# comprimir lambda 3
data "archive_file" "lambda_zip_file_3" {
  output_path = "${var.directorio-base}${var.nombre-proyecto}/zip/${var.lambda_modificar_repositorio}.zip"
  source_dir  = "${var.directorio-base}${var.nombre-proyecto}/${var.lambda_modificar_repositorio}"
  excludes    = ["__init__.py", "*.pyc"]
  type        = "zip"
}

# subir la función lambda 3
resource "aws_lambda_function" "lambda_modificar_repositorio" {
  function_name     = var.lambda_modificar_repositorio
  filename          = data.archive_file.lambda_zip_file_3.output_path
  source_code_hash  = data.archive_file.lambda_zip_file_3.output_base64sha256
  handler           = var.handler-para-lambda-3
  role              = module.roles-y-politicas.asume-rol
  runtime           = var.runtime-para-lambda-3

  lifecycle {
    create_before_destroy = true
  }
}

# comprimir lambda 4
data "archive_file" "lambda_zip_file_4" {
  output_path = "${var.directorio-base}${var.nombre-proyecto}/zip/${var.lambda_ejecutar_pipeline}.zip"
  source_dir  = "${var.directorio-base}${var.nombre-proyecto}/${var.lambda_ejecutar_pipeline}"
  excludes    = ["__init__.py", "*.pyc"]
  type        = "zip"
}

# subir la función lambda 4
resource "aws_lambda_function" "lambda_ejecutar_pipeline" {
  function_name     = var.lambda_ejecutar_pipeline
  filename          = data.archive_file.lambda_zip_file_4.output_path
  source_code_hash  = data.archive_file.lambda_zip_file_4.output_base64sha256
  handler           = var.handler-para-lambda-4
  role              = module.roles-y-politicas.asume-rol
  runtime           = var.runtime-para-lambda-4

  lifecycle {
    create_before_destroy = true
  }
}

# comprimir lambda 5
data "archive_file" "lambda_zip_file_5" {
  output_path = "${var.directorio-base}${var.nombre-proyecto}/zip/${var.lambda_validar_capacidad}.zip"
  source_dir  = "${var.directorio-base}${var.nombre-proyecto}/${var.lambda_validar_capacidad}"
  excludes    = ["__init__.py", "*.pyc"]
  type        = "zip"
}

# subir la función lambda 5
resource "aws_lambda_function" "lambda_validar_capacidad" {
  function_name     = var.lambda_validar_capacidad
  filename          = data.archive_file.lambda_zip_file_5.output_path
  source_code_hash  = data.archive_file.lambda_zip_file_5.output_base64sha256
  handler           = var.handler-para-lambda-5
  role              = module.roles-y-politicas.asume-rol
  runtime           = var.runtime-para-lambda-5

  lifecycle {
    create_before_destroy = true
  }
}
