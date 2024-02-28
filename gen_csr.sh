#!/bin/bash
openssl ecparam -genkey -name secp384r1 | \
	openssl ec -out ecc-privkey.pem

openssl req -new \
	-key ecc-privkey.pem \
	-subj "/C=CN/ST=CN/L=CN/O=CN/OU=CN/CN=foo.com/" \
    -addext "subjectAltName = DNS:foo.com, DNS:*.foo.com" \
	-outform pem -out ecc-csr.pem
