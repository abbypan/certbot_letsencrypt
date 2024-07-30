#!/bin/bash

DOM=$1

openssl ecparam -genkey -name secp384r1 | \
	openssl ec -out $DOM-privkey.pem

openssl req -new \
	-key ecc-privkey.pem \
	-subj "/C=CN/ST=CN/L=CN/O=CN/OU=CN/CN=foo.com/" \
    -addext "subjectAltName = DNS:$DOM" \
	-outform pem -out $DOM-csr.pem
