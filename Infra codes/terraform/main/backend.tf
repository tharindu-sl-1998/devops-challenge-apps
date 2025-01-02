terraform {
  backend "azurerm" {
    # These values will be provided after manual storage account creation
    resource_group_name  = "rg-fractionalx-org"
    storage_account_name = "stfractionalxorg001"
    container_name       = "wp-test-terraform"
    key                  = "terraform.tfstate"
  }
} 