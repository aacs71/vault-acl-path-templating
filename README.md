# Bootstrapping Vault with terraform

Just an experiment how to bootstrap a vault via terraform

- Creating initial approle
- Enabling secrets engines (KV v2, pki, aws)
- Enabling auth methods (userpass, cert and approles)
- Creating entities and assign alias to auth method accessors
- ACL Policy Path Templating

After the bootstrap a user/application or service can access vault via different auth methods and using secrets engines. 
The actions are restricted to is own path (Path templates) or role (in case of AWS) evaluated on each request.

# Steps

Init vault, unseal it and create the admin app role
```
$ cd 01-initvault
$ ./clean.sh
$ ./start-vault.sh
$ ./unseal.sh
$ ./create-god-role

```

change to 02-bootstrap-vault for final bootstrap

```
$ cd 02-bootstrap-vault
$ ./00-clean.sh
$ ./01-gen-tf-vars.sh
```

review `service.tf` and change the names and/or output names and execute terraform

```
$ terraform init
$ terraform apply

```

Use the output to test the 3 auth methods configured (userpass, cert and approle) and test the path permissions



