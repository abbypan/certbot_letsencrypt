#!/bin/bash
certbot certonly --non-interactive --webroot \
		-w /var/www/html \
		-d foo.com -d *.foo.com \
		--email foousr@gmail.com \
		--csr ecc-csr.pem \
		--agree-tos >> cert.log 2>&1

mv 0000_cert.pem cert.pem
mv 0000_chain.pem chain.pem
mv 0001_chain.pem fullchain.pem
cp ecc-privkey.pem privkey.pem
