use Test::More;
use Parse::RecDescent;
use Authen::Tcpdmatch::Grammar;

plan tests => 9;

my  Authen::Tcpdmatch::Grammar   $r : TcpdParser  ;


ok     $r->Start( 'ALL: .1'              =>   qw( 0  tcp  192.168.0.1  ));
ok     $r->Start( 'ALL: .0.1'            =>   qw( 0  tcp  192.168.0.1  ));
ok     $r->Start( 'ALL: .168.0.1'        =>   qw( 0  tcp  192.168.0.1  ));


is   +($r->Start( 'ALL: .2'              =>   qw( 0  tcp   192.168.0.1  ))),  undef;
is   +($r->Start( 'ALL: .0.2'            =>   qw( 0  tcp   192.168.0.1  ))),  undef;
is   +($r->Start( 'ALL: .168.0.2'        =>   qw( 0  tcp   192.168.0.1  ))),  undef;

ok     $r->Start( 'ALL: red .1'          =>   qw( 0  tcp   192.168.0.1  ));
is   +($r->Start( 'ALL: red .2'          =>   qw( 0  tcp   292.168.0.1  ))),  undef;


## Extra 

is   +($r->Start( 'ALL: ..1'             =>   qw( 0  tcp   192.168.0.1  ))),  undef;

