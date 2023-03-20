
resource "openstack_networking_secgroup_v2" "default" {
  name = var.name
}

resource "openstack_networking_secgroup_rule_v2" "rule" {
  for_each = {
    for i, rule in var.rules : "rule-${i}" => rule
  }

  direction         = each.value.direction
  ethertype         = "IPv4"
  protocol          = each.value.protocol
  port_range_min    = each.value.port_min
  port_range_max    = each.value.port_max
  remote_ip_prefix  = each.value.remote_ip_prefix
  security_group_id = openstack_networking_secgroup_v2.default.id
}

output "id" {
  value = openstack_networking_secgroup_v2.default.id
}
