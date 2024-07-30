#!/usr/bin/perl
use JSON;
use Env;

our $GODADDY_URL = "https://api.godaddy.com/v1/domains/";
our $ACME_SUBDOM = '_acme-challenge';

my ( $access_key_id, $access_key_secret, $domain, $acme_rr ) = @ARGV;
$access_key_id     ||= $GODADDY_KEY_ID;
$access_key_secret ||= $GODADDY_KEY_SECRET;
$domain            ||= $CERTBOT_DOMAIN;
$acme_rr           ||= $CERTBOT_VALIDATION;

exit unless ( $domain and $acme_rr );

put_dns_acme_challenge_txt( $access_key_id, $access_key_secret, $domain, $acme_rr );

#create_dns_rr($access_key_id, $access_key_secret, $domain, $acme_rr);
#delete_dns_acme_challenge_txt($access_key_id, $access_key_secret, $domain);

sleep 20;

sub put_dns_acme_challenge_txt {
  my ( $access_key_id, $access_key_secret, $domain, $acme_rr ) = @_;
  my $api  = $GODADDY_URL . $domain . "/records/TXT/$ACME_SUBDOM";
  my $data = [ { data => $acme_rr, ttl => 600 } ];
  curl_godaddy_api( $access_key_id, $access_key_secret, $api, 'PUT', $data );
}

sub delete_dns_acme_challenge_txt {
  my ( $access_key_id, $access_key_secret, $domain ) = @_;
  my $api = $GODADDY_URL . $domain . "/records/TXT/$ACME_SUBDOM";
  curl_godaddy_api( $access_key_id, $access_key_secret, $api, 'DELETE', {} );
}

sub create_dns_rr {
  my ( $access_key_id, $access_key_secret, $domain, $acme_rr ) = @_;
  my $api  = $GODADDY_URL . $domain . "/records";
  my $data = [ { data => $acme_rr, name => $ACME_SUBDOM, ttl => 600, type => "TXT" } ];
  curl_godaddy_api( $access_key_id, $access_key_secret, $api, 'PATCH', $data );
}

sub curl_godaddy_api {
  my ( $access_key_id, $access_key_secret, $api, $method, $data ) = @_;
  my $json_data = encode_json $data;
  my $cmd =
    qq[curl -sSL -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: sso-key $access_key_id:$access_key_secret" -X $method "$api" -d '$json_data' ];
    #printf $cmd, "\n";
  system( $cmd);
}
