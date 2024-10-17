variable "resource_group_name" {
  type        = string
  description = "Nombre del resource group"
}

variable "vnet_name" {
  type        = string
  description = "Nombre de la red virtual"
  validation {
    condition     = can(regex("^vnet[a-z]{3,}tfexercise[[:digit:]]{2,}$", var.vnet_name))
    error_message = "La cadena no cumple las carácterísticas requeridas"
  }
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Espacio de direcciones de la red virtual"
}

variable "location" {
  type = string
  #default     = "West Europe"
  description = "Ubicación donde se desplegará la red"
}

# TAGS
variable "owner_tag" {
  type        = string
  description = "Propietario de la red"
  validation {
    condition     = var.owner_tag != "" && var.owner_tag != null
    error_message = "owner_tag no puede ser una cadena vacía o nula"
  }
}

locals {
  entornos_aceptados = ["dev", "pro", "tes", "pre"]
}
variable "environment_tag" {
  type        = string
  description = "Entorno de la red"
  validation {
    condition     = contains(local.entornos_aceptados, lower(var.environment_tag))
    error_message = "environment_tag debe ser 'dev', 'pro', 'tes' o 'pre'"
  }
}

variable "vnet_tags" {
  type        = map(string)
  description = "Tags adicionales que se aplicarán a la red"
  default = {}
}
