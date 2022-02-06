# certbot_renew_letsencrypt_godaddy

## install 

    apt-get install certbot letsencrypt curl
    cpan JSON

## certbot

https://eff-certbot.readthedocs.io/en/stable/using.html

## godaddy production key and secret

https://developer.godaddy.com/doc/endpoint/domains

suppose that 

    GODADDY_KEY_ID="aaaa"
    GODADDY_KEY_SECRET="bbbb"

## usage
    
    # manual
    certbot renew --manual --preferred-challenges dns --manual-auth-hook "./certbot_renew_letsencrypt_godaddy.pl [godaddy_key_id] [godaddy_key_secret]"
    certbot renew --manual --preferred-challenges dns --manual-auth-hook "./certbot_renew_letsencrypt_godaddy.pl aaaa bbbb"
    
    #set environment variable
    export GODADDY_KEY_ID="aaaa"
    export GODADDY_KEY_SECRET="bbbb"

    certbot renew --manual --preferred-challenges dns --manual-auth-hook "./certbot_renew_letsencrypt_godaddy.pl"
