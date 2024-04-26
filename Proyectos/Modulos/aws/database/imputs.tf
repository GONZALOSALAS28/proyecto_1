variables "ambiente" {
    description = "puede ser dev, sta , qa ,prd"
    type = string
}

variable "nombre-tabla"{
     description = "Nombre da la tabla dynamodb para el log de eventos"
     type = string
}

variable "modo-factura"{
     description = ""
     type = string

}

variable "Lecturas"{
     description = ""
     type = string

}

variable "escrituras"{
     description = ""
     type = string

}

variable "clave-hash"{
     description = ""
     type = string

}

variable "clave-orden"{
     description = ""
     type = string

}

variable "tipo-hash"{
     description = ""
     type = string

}

variable "tipo-orden"{
     description = ""
     type = string

}

