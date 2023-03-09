#!/bin/bash

CANAME=$1

openssl genrsa -out $CANAME-key.pem 4096

openssl req -x509 -new -nodes -key $CANAME-key.pem -sha256 -days 1826 -out $CANAME.pem -subj '/CN=MyLocalCA/C=PT/ST=Braga/L=Famalicao/O=Casa'
