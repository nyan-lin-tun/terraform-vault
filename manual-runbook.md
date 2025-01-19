# enable authentication method
# userpass authentication method

# dev1
type : userpass
path : dev1

# dev2
type : userpass
path : dev2

# dev3
type : userpass
path : team3

# dev1_policy
name = dev1-policy
policy = path "kvv2-dev1/*" {
  capabilities = ["read", "list]
}

# dev2_policy
name = dev2-policy
policy = path "kvv2-dev2/*" {
  capabilities = ["read", "list]
}

# enabling secrets engine
type = "kv-v2"
path = "kvv2-dev1"

# testing user info
