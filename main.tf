resource "vault_auth_backend" "userpass_dev1" {
  type = "userpass"
  path = "dev1"
}

resource "vault_auth_backend" "userpass_dev2" {
  type = "userpass"
  path = "dev2"
}

resource "vault_auth_backend" "userpass_dev3" {
  type = "userpass"
  path = "dev3"
}