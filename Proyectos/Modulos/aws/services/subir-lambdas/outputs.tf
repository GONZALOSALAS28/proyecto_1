output "arn-lambda-1"{
    value = aws_lambda_function.lambda_inicializar_repositorio.arn
}

output "arn-lambda-2"{
    value = aws_lambda_function.lambda_inicializar_repositorio.arn
}

output "arn-lambda-3"{
    value = aws_lambda_function.lambda_modificar_repositorio.arn
}

output "arn-lambda-4"{
    value = aws_lambda_function.lambda_ejecutar_pipeline.arn
}

output "arn-lambda-5"{
    value = aws_lambda_function.lambda_validar_capacidad.arn
}
