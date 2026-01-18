
output "vmss_web_id" {
  value = azurerm_linux_virtual_machine_scale_set.vmss_web[0].id
}

