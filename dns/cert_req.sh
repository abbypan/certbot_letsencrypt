#!/bin/bash
DOM=$1
certbot certonly -v --manual --preferred-challenges dns -d $DOM  -d *.$DOM --debug-challenges  --manual-auth-hook "./godaddy_auth_hook.pl" --manual-cleanup-hook "./godaddy_cleanup_hook.pl"  --non-interactive
