# letsencrypt cert request 

# install

debian:

    apt install certbot apache2 openssl

# prepare

domain: example.com

mail: foousr@gmail.com

web dir: /var/www/html

# request cert

generate ecc-privkey.pem, ecc-csr.pem:

    ./gen_csr.sh

request cert:

    ./req_cert.sh

finally output:

    cert.pem, chain.pem, fullchain.pem

    ecc-privkey.pem -> privkey.pem
