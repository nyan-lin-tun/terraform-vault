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
    path "cubbyhole/*" {
    capabilities = ["deny"]
    }
EOT
}

resource "vault_policy" "dev2_policy" {
  name = "dev2-policy" #  Name here mean the name of the resource in vault

  policy = <<EOT
    path "kvv2-dev2/*" {
    capabilities = ["read", "list"]
    }
    path "cubbyhole/*" {
    capabilities = ["deny"]
    }
EOT
}

resource "vault_policy" "dev3_policy" {
  name = "dev3-policy" #  Name here mean the name of the resource in vault

  policy = <<EOT
path "kvv2-dev3/*" {
  capabilities = ["read", "list"]
}
EOT
}

resource "vault_mount" "dev1-kvv2-mount" {
  path        = "kvv2-dev1"
  type        = "kv-v2"
  description = "This is dev1 kvv2 mount secret engine"
}

resource "vault_mount" "dev2-kvv2-mount" {
  path        = "kvv2-dev2"
  type        = "kv-v2"
  description = "This is dev2 kvv2 mount secret engine"
}

resource "vault_kv_secret_v2" "kvv2-dev1-master-secret" {
  mount = vault_mount.dev1-kvv2-mount.path
  name  = "aws-master-account"
  data_json = jsonencode(
    {
      username = "master-admin"
      password = "password"
      region   = "singapore"
    }
  )
}

resource "vault_kv_secret_v2" "kvv2-dev1-dev-secret" {
  mount = vault_mount.dev1-kvv2-mount.path
  name  = "aws-dev-account"
  data_json = jsonencode(
    {
      username = "dev-admin"
      password = "password2"
      region   = "singapore2"
    }
  )
}

# for dev2
resource "vault_kv_secret_v2" "kvv2-dev2-master-secret" {
  mount = vault_mount.dev2-kvv2-mount.path
  name  = "aws-master2-account"
  data_json = jsonencode(
    {
      username = "master2-admin"
      password = "password"
      region   = "singapore"
    }
  )
}

resource "vault_kv_secret_v2" "kvv2-dev2-dev-secret" {
  mount = vault_mount.dev2-kvv2-mount.path
  name  = "aws-dev2-account"
  data_json = jsonencode(
    {
      username = "dev2-admin"
      password = "password2"
      region   = "singapore2"
    }
  )
}

# Users
resource "vault_generic_endpoint" "dev1-account" {
  depends_on = [vault_auth_backend.userpass_dev1]
  path       = "auth/dev1/users/dev1-admin"
  data_json  = <<EOT
    {
    "password" : "password",
    "policies" : ["dev1-policy"]
    }
    EOT
}

resource "vault_generic_endpoint" "dev2-account" {
  depends_on = [vault_auth_backend.userpass_dev2]
  path       = "auth/dev2/users/dev2-admin"
  data_json  = <<EOT
    {
    "password" : "password",
    "policies" : ["dev2-policy"]
    }
    EOT
}