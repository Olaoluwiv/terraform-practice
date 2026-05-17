# Built-in Functions
Terraform is an infrastructure as code (IaC) tool that allows you to define and provision infrastructure resources in a declarative manner. Terraform provides a wide range of built-in functions that you can use within your configuration files (usually written in HashiCorp Configuration Language, or HCL) to manipulate and transform data. These functions help you perform various tasks when defining your infrastructure. Here are some commonly used built-in functions in Terraform:

concat(list1, list2, ...): Combines multiple lists into a single list.
```hcl
# concat() - Combines multiple lists into one list

variable "list1" {
  type    = list(string)
  default = ["a", "b"]
}

variable "list2" {
  type    = list(string)
  default = ["c", "d"]
}

output "combined_list" {
  value = concat(var.list1, var.list2)
}

# element() - Returns an item from a list using its index

variable "my_list" {
  type    = list(string)
  default = ["apple", "banana", "cherry"]
}

output "selected_element" {
  value = element(var.my_list, 1)
}

# length() - Returns the total number of items in a list

output "list_length" {
  value = length(var.my_list)
}

# zipmap() - Creates a map from two separate lists

variable "keys" {
  type    = list(string)
  default = ["name", "age"]
}

variable "values" {
  type    = list(string)
  default = ["Alice", "30"]
}

output "my_map" {
  value = zipmap(var.keys, var.values)
}

# lookup() - Retrieves a value from a map using a key

variable "person_map" {
  type = map(string)

  default = {
    name = "Alice"
    age  = "30"
  }
}

output "lookup_value" {
  value = lookup(var.person_map, "name", "Not Found")
}

# join() - Converts a list into a single string

output "joined_string" {
  value = join(", ", var.my_list)
}
These are just a few examples of the built-in functions available in Terraform. You can find more functions and detailed documentation in the official Terraform documentation, which is regularly updated to include new features and improvements.
