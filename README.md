# letsencrypt cert request/renew 

certbot: https://eff-certbot.readthedocs.io/en/stable/using.html

# install

debian:

    apt install certbot apache2 openssl letsencrypt curl
    cpan JSON

# webroot

domain: foo.com

web dir: /var/www/html

## request cert

    cd webroot
    ./gen_csr.sh foo.com
    ./cert_req.sh foo.com

output:
    cert.pem, chain.pem, fullchain.pem, privkey.pem

    
# dns

domain: foo.com

wildcard domain: *.foo.com

## godaddy production key and secret

https://developer.godaddy.com/doc/endpoint/domains

suppose that 

    GODADDY_KEY_ID="aaaa"
    GODADDY_KEY_SECRET="bbbb"

## request cert
    
    #set environment variable
    export GODADDY_KEY_ID="aaaa"
    export GODADDY_KEY_SECRET="bbbb"

    cd dns
    ./cert_req.sh foo.com

    #manual
    certbot certonly -v --manual --preferred-challenges dns -d foo.com  -d *.foo.com --debug-challenges  --manual-auth-hook "./godaddy_auth_hook.pl" --manual-cleanup-hook "./godaddy_cleanup_hook.pl"
