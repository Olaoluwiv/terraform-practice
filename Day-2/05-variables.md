Variables
Input and output variables in Terraform are essential for parameterizing and sharing values within your Terraform configurations and modules. They allow you to make your configurations more dynamic, reusable, and flexible.
```
Input Variables
Input variables are used to parameterize your Terraform configurations. They allow you to pass values into your modules or configurations from the outside. Input variables can be defined within a module or at the root level of your configuration. Here's how you define an input variable:

variable "example_var" {
  description = "An example input variable"
  type        = string
  default     = "default_value"
}
```
In this example:

variable is used to declare an input variable named example_var.
description provides a human-readable description of the variable.
type specifies the data type of the variable (e.g., string, number, list, map, etc.).
default provides a default value for the variable, which is optional.
You can then use the input variable within your module or configuration like this:
```
resource "example_resource" "example" {
  name = var.example_var
  # other resource configurations
}
You reference the input variable using var.example_var.
```
