variable "lambda_crear_repositorio"{
    description = "El nombre de la funcion lambda para el paso 1"
     type = string
}

variable "lambda_inicializar_repo"{
    description = "El nombre de la funcion lambda para el paso 2"
     type = string
}

variable "lambda_modificar_repositorio"{
    description = "El nombre de la funcion lambda para el paso 3"
     type = string
}

variable "lambda_ejecutar_pipeline"{
    description = "El nombre de la funcion lambda para el paso 4"
     type = string
}

variable "lambda_validar_capacidad"{
    description = "El nombre de la funcion lambda para el paso 5"
    type = string
}