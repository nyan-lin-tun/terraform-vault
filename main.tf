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

resource "vault_policy" "dev1_policy" {
  name = "dev1-policy" #  Name here mean the name of the resource in vault

  policy = <<EOT
    path "kvv2-dev1/*" {
    capabilities = ["read", "list"]
    }
EOT
}

resource "vault_policy" "dev2_policy" {
  name = "dev2-policy" #  Name here mean the name of the resource in vault

  policy = <<EOT
path "kvv2-dev2/*" {
  capabilities = ["read", "list"]
}
EOT
}