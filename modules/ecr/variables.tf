variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "force_delete" {
  description = "Whether to allow the repository to be forcefully deleted even if it contains images"
  type        = bool
  default     = true
}

variable "scan_on_push" {
  description = "Enable automated vulnerability scanning of images when they are pushed to the repository"
  type        = bool
  default     = true
}

variable "image_tag_mutability" {
  description = "Specifies whether image tags can be overwritten (MUTABLE) or are immutable (IMMUTABLE)"
  type        = string
  default     = "MUTABLE"
}
