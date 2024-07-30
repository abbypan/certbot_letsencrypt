#!/bin/bash
DOM=$1

certbot certonly --non-interactive --webroot \
		-w /var/www/html \
		-d $DOM \
		--csr $DOM-csr.pem \
		--agree-tos >> cert.log 2>&1

mv 0000_cert.pem cert.pem
mv 0000_chain.pem chain.pem
mv 0001_chain.pem fullchain.pem
cp $DOM-privkey.pem privkey.pem
