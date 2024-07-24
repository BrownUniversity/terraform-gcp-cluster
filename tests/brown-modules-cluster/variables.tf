variable "org_id" {
  type = string
}
variable "billing_account" {
  type = string
}
variable "folder_id" {
  type = string
}
variable "activate_apis" {
  type        = list(string)
  description = "The list of apis to activate within the project"
  default = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "containerregistry.googleapis.com",
    "appengine.googleapis.com"
  ]
}
