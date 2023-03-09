#!/bin/bash

mkdir -p ./vault-db

vault server -config=primary.hcl
