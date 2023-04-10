locals {
  acls = {
    all       = { rule_action = "allow", protocol = "-1", from_port = 0, to_port = 0, cidr_block = "0.0.0.0/0" }
    http      = { rule_action = "allow", protocol = "6", from_port = 80, to_port = 80, cidr_block = "0.0.0.0/0" }
    https     = { rule_action = "allow", protocol = "6", from_port = 443, to_port = 443, cidr_block = "0.0.0.0/0" }
    ntp       = { rule_action = "allow", protocol = "17", from_port = 123, to_port = 123, cidr_block = "0.0.0.0/0" }
    smtp      = { rule_action = "allow", protocol = "6", from_port = 587, to_port = 587, cidr_block = "0.0.0.0/0" }
    ephemeral = { rule_action = "allow", protocol = "6", from_port = 1024, to_port = 65535, cidr_block = "0.0.0.0/0" }
  }
}