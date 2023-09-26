output "external_ip_address_vm_1" {
  value = module.ya_instance_1.external_ip_address_vm
}
output "external_ip_address_vm_2" {
  value = module.ya_instance_2.external_ip_address_vm
}

output "external_ip_address_lb" {
  value = [for s in yandex_lb_network_load_balancer.sf-load-balancer.listener : [for a in s.external_address_spec : a.address]]
}
