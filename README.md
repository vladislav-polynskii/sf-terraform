## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.99.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.99.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ya_instance_1"></a> [ya\_instance\_1](#module\_ya\_instance\_1) | ./modules/ya-instance | n/a |
| <a name="module_ya_instance_2"></a> [ya\_instance\_2](#module\_ya\_instance\_2) | ./modules/ya-instance | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_lb_network_load_balancer.sf-load-balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/0.99.1/docs/resources/lb_network_load_balancer) | resource |
| [yandex_lb_target_group.sf-target-group](https://registry.terraform.io/providers/yandex-cloud/yandex/0.99.1/docs/resources/lb_target_group) | resource |
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/0.99.1/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet1](https://registry.terraform.io/providers/yandex-cloud/yandex/0.99.1/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.subnet2](https://registry.terraform.io/providers/yandex-cloud/yandex/0.99.1/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_token"></a> [token](#input\_token) | Yandex autorization token from bash env. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_lb"></a> [external\_ip\_address\_lb](#output\_external\_ip\_address\_lb) | n/a |
| <a name="output_external_ip_address_vm_1"></a> [external\_ip\_address\_vm\_1](#output\_external\_ip\_address\_vm\_1) | n/a |
| <a name="output_external_ip_address_vm_2"></a> [external\_ip\_address\_vm\_2](#output\_external\_ip\_address\_vm\_2) | n/a |
