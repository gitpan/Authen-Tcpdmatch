use Test::More;
use Authen::Tcpdmatch::Grammar;


plan tests => 8;

my  Authen::Tcpdmatch::Grammar   $r : TcpdParser  ;



ok     $r->Start( "tcp : red \n ftp   : ntro" ,   qw( 0  tcp  red )) ;
ok     $r->Start( "tcp : red \n ftp   : ntro" ,   qw( 0  ftp  ntro )) ;
ok     $r->Start( "tcp : red \n\n ftp : ntro" ,   qw( 0  ftp  ntro )) ;
ok     $r->Start( "tcp : red \n ftp     ntro" ,   qw( 0  tcp  red )) ;
ok     $r->Start( "tcp   red \n\n ftp : ntro" ,   qw( 0  ftp  ntro )) ;

is   +( $r->Start( "tcp : red \n ftp : ntro" ,   qw( 0  tcp  ntro ))),  undef ;
is   +( $r->Start( "tcp : red \n ftp : ntro" ,   qw( 0  ftp  red  ))),  undef ;


ok     $r->Start( <<'' ,   qw( 0  tcp  red )) ;
#afa
irc   red
tcp : red

