
variable "name" {
  type = string
}

variable "rules" {
  type = list(object({
    direction        = optional(string, "ingress")
    protocol         = optional(string, "tcp")
    port_min         = number
    port_max         = number
    remote_ip_prefix = optional(string, "0.0.0.0/0")
  }))
}
