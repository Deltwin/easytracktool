#!/usr/bin/perl
# IP Tracker
# By Deltwin
# Visita : https://www.francescoscarselli.it
# Visita : https://youtube.com/Sogliette
# API documentazione - http://ip-api.com/docs/
# Puoi vedere il tuo ip esterno usando questo comando bash:
# leggi l'ip della nazione <<< $(wget -qO- http://ip-api.com/line/?fields=countryCode,query); echo $IP $COUNTRY
# startando:

use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;
  
 
print color 'bold bright_green';
 
print q{


██╗██████╗     ████████╗██████╗  █████╗  ██████╗██╗  ██╗███████╗██████╗ 
██║██╔══██╗    ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
██║██████╔╝       ██║   ██████╔╝███████║██║     █████╔╝ █████╗  ██████╔╝
██║██╔═══╝        ██║   ██╔══██╗██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
██║██║            ██║   ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║
╚═╝╚═╝            ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
                                                                                                                             
IP : Tracker Tool  
By : Deltwin
Language : IT | Long : Italian

------------------------------------
};
 
print color 'reset';
@iphost=$ARGV[0] || die "Usare: perl iptracker.pl [host] [ip] [dominio]\nEsempio: perl iptracker.pl www.google.com [Oppure inserire un ip]\n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP o Host invalido!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); # JSON API OF IP-API.COM
    my $json = $GET->content();
 
 
my $info = decode_json($json);
# Json API Response :
# A successful request will return, by default, the following:
#{
#    "status": "successo",
#    "country": "COUNTRY",
#    "countryCode": "COUNTRY CODE",
#    "region": "REGION CODE",
#    "regionName": "REGION NAME",
#    "city": "CITY",
#    "zip": "ZIP CODE",
#    "lat": LATITUDE,
#    "lon": LONGITUDE,
#    "timezone": "TIME ZONE",
#    "isp": "ISP NAME",
#    "org": "ORGANIZATION NAME",
#    "as": "AS NUMBER / NAME",
#   "query": "IP ADDRESS USED FOR QUERY"
# }
# INFOS OF JSON API ...
 
print "  [!] IP: ", $info->{'query'}, "\n";
print "------------------------------------\n"; 
print "  [+] ORGANIZZAZIONE: ", $info->{'as'}, "\n";
print "  [+] ISP: ", $info->{'isp'}, "\n";
print "  [+] Nazione: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [+] Città: ", $info->{'city'}, "\n";
print "  [+] Regione: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  [+] Geo: ", "Longitudine: " , $info->{'lat'}, " - Long: ", $info->{'lon'}, "\n";
print "  [+] Geo: ", "Latitudine: " , $info->{'lat'}, " - Long: ", $info->{'lat'}, "\n";
print "  [+] Ora: ", "Ora legale: " , $info->{'timezone'}, " - Long: ", $info->{'timezone'}, "\n";
print "  [+] Ha un numero/nome: ", "as: " , $info->{'as'}, " - Long: ", $info->{'as'}, "\n";
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] Lingua nazione: ", $info->{'countryCode'}, "\n"; 
print "  [+] Stato: ", $info->{'status'}, "\n"; 
print "\n";
# EOF
