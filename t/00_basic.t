use Test::More;
use Authen::Tcpdmatch::Grammar;

plan tests => 17;
my  Authen::Tcpdmatch::Grammar   $r : TcpdParser  ;
 


ok     $r->Start( 'tcp : red'                 =>   qw( 0  tcp   red          )) ;
ok     $r->Start( "tcp : red \n ftp : ntro"   =>   qw( 0  tcp   red          )) ;
is    +( $r->Start( ''                        =>   qw( 0  tcp   red          ))),  undef ;
is  +( $r->Start( 'chat irc : red'            =>   qw( 0  irc   hh           ))),  undef ;

ok     $r->Start( 'chat irc EXCEPT ftp: red'  =>   qw( 0  irc   red          ));
is  +( $r->Start( 'chat irc EXCEPT irc: red'  =>   qw( 0  irc   red          ))),  undef ;
ok     $r->Start( 'irc ALL: red'              =>   qw( 0  irc   red          ));
ok     $r->Start( 'irc ALL: red'              =>   qw( 0  ftp   red          ));
ok     $r->Start( 'irc    : LOCAL'            =>   qw( 0  irc   red          ));
is  +( $r->Start( 'irc    : LOCAL'            =>   qw( 0  irc   red.haw.org  ))),  undef;
ok     $r->Start( 'irc    : .haw.org'         =>   qw( 0  irc   red.haw.org  ));
is  +( $r->Start( 'irc    : .haw.org'         =>   qw( 0  ftp   red.haw.org  ))),  undef ;
ok     $r->Start( 'irc    :  192.168.'        =>   qw( 0  irc   192.168.0.1  ));
ok     $r->Start( 'ALL: 192.168.0.1/24'       =>   qw( 0  tcp   192.168.0.6  ));
is  +( $r->Start( 'ALL: 192.168.0.1/24'       =>   qw( 0  tcp   192.168.2.1  ))) , undef;
ok     $r->Start( 'chat irc EXCEPT irc EXCEPT irc: red'      =>   qw( 0  irc  red ));

ok     $r->Start( <<'MASSAGE' ,   qw( 0  tcp  red )) ;
#afa

irc   red
tcp : red
chat: ntro
MASSAGE


