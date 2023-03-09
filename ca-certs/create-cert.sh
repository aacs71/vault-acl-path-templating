#!/bin/bash

if [ "$#" -ne 2 ]
then
  echo "Usage: Must supply a domain and the ca"
  exit 1
fi

DOMAIN=$1
CANAME=$2

openssl genrsa -out $DOMAIN-key.pem 4096
openssl req -new -key $DOMAIN-key.pem -out $DOMAIN.csr -subj "/CN=$DOMAIN/C=PT/ST=Braga/L=Famalicao/O=Casa"

cat > $DOMAIN.ext << EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = $DOMAIN
IP.1 = 127.0.0.1
EOF

openssl x509 -req -in $DOMAIN.csr -CA $CANAME.pem -CAkey $CANAME-key.pem -CAcreateserial -out $DOMAIN.pem -days 825 -sha256 -extfile $DOMAIN.ext 

