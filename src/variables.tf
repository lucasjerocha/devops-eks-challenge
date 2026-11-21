
variable "aws_region" {
  description = "Região usada para criar os recursos da AWS"
  type        = string
  nullable    = false
}

variable "aws_vpc_name" {
  description = "Nome da VPC a ser criada"
  type        = string
  nullable    = false
}

variable "aws_vpc_cidr" {
  description = "bloco CIDR da VPC"
  type        = string
  nullable    = false
}

variable "aws_vpc_azs" {
  description = "Zonas de disponibilidade para a VPC"
  type        = set(string)
  nullable    = false
}

variable "aws_vpc_private_subnets" {
  description = "Subnets privadas para a VPC"
  type        = set(string)
  nullable    = false
}

variable "aws_public_subnets" {
  description = "Subnets públicas para a VPC"
  type        = set(string)
  nullable    = false
}


variable "aws_eks_name" {
  description = "Nome do cluster EKS"
  type        = string
  nullable    = false
}


variable "aws_eks_version" {
  description = "Versão do cluster EKS"
  type        = string
  nullable    = false
}


variable "eks_managed_node_groups" {
  description = "value"
  type        = set(string)
  nullable    = false
}


variable "aws_project_tags" {
  description = "value"
  type        = map(any)
  nullable    = false
}