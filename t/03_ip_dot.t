use strict;
use Test::More;
use Authen::Tcpdmatch::Grammar;

plan tests => 13;

my  Authen::Tcpdmatch::Grammar   $r : TcpdParser  ;


ok     $r->Start( 'ALL: 192.'            =>   qw( 0  tcp  192.168.0.1  ));
ok     $r->Start( 'ALL: 192.168.'        =>   qw( 0  tcp  192.168.0.1  ));
ok     $r->Start( 'ALL: 192.168.0.'      =>   qw( 0  tcp  192.168.0.1  ));


is   +($r->Start( 'ALL: 192.'            =>   qw( 0  tcp   292.168.0.1  ))),  undef;
is   +($r->Start( 'ALL: 192x'            =>   qw( 0  tcp   292.168.0.1  ))),  undef;
is   +($r->Start( 'ALL: 192.168.'        =>   qw( 0  tcp   292.168.0.1  ))),  undef;
is   +($r->Start( 'ALL: 192.168.0'       =>   qw( 0  tcp   292.168.0.1  ))),  undef;

ok     $r->Start( 'ALL: red 192.168.'    =>   qw( 0  tcp   192.168.0.1  ));
is   +($r->Start( 'ALL: red 192.168.'    =>   qw( 0  tcp   292.168.0.1  ))),  undef;


## Extra 
is   +($r->Start( 'ALL: 192..'           =>   qw( 0  tcp   192.168.0.1  ))),  undef;
is   +($r->Start( 'ALL: 192.168..'       =>   qw( 0  tcp   192.168.0.1  ))),  undef;
is   +($r->Start( 'ALL: 192.168.0..'     =>   qw( 0  tcp   192.168.0.1  ))),  undef;
is   +($r->Start( 'ALL: ALL EXCEPT 192.' =>   qw( 0  tcp   192.168.0.1  ))),  undef;

