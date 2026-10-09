locals {
  fgt_vm_ids = concat(
    azurerm_virtual_machine.customfgtvm[*].id,
    azurerm_virtual_machine.fgtvm[*].id,
  )
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "fgt" {
  count                 = length(local.fgt_vm_ids)
  virtual_machine_id    = local.fgt_vm_ids[count.index]
  location              = var.location
  enabled               = true
  daily_recurrence_time = "1800"
  timezone              = "GTB Standard Time"

  notification_settings {
    enabled = false
  }
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "windows10" {
  virtual_machine_id    = azurerm_windows_virtual_machine.windows10-vm.id
  location              = var.location
  enabled               = true
  daily_recurrence_time = "1800"
  timezone              = "GTB Standard Time"

  notification_settings {
    enabled = false
  }
}
