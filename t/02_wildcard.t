use Test::More;
use Authen::Tcpdmatch::Grammar;


plan tests => 15;

my  Authen::Tcpdmatch::Grammar   $r : TcpdParser  ;




##############################################################  SERVICES

ok      $r->Start( 'ALL: red'                  =>   qw( 0  tcp  red  ));
ok      $r->Start( 'irc ALL: red'              =>   qw( 0  tcp  red  ));
is    +($r->Start( 'ALL EXCEPT tcp: red'       =>   qw( 0  tcp  red  ))),  undef;
ok      $r->Start( 'tcp EXCEPT irc, chat: red' =>   qw( 0  tcp  red  ));
ok      $r->Start( 'ALL: ALL'                  =>   qw( 0  tcp  red  ));
ok      $r->Start( 'ALL: LOCAL'                =>   qw( 0  tcp  red  ));


##############################################################  REMOTES

ok      $r->Start( 'tcp: LOCAL'                =>   qw( 0  tcp  red   ));
is    +($r->Start( 'tcp: LOCAL'                =>   qw( 0  tcp  r.edu ))) , undef ;
ok      $r->Start( 'tcp: LOCAL, red'           =>   qw( 0  tcp  red   ));
ok      $r->Start( 'tcp: red LOCAL'            =>   qw( 0  tcp  red   ));
is    +($r->Start( 'tcp: red LOCAL'            =>   qw( 0  tcp  r.edu ))) , undef ;
  
is    +($r->Start( 'tcp: ALL EXCEPT red  '     =>   qw( 0  tcp  red   ))),  undef;
ok      $r->Start( 'tcp: ALL EXCEPT ntro '     =>   qw( 0  tcp  red   ));

is    +($r->Start( 'tcp EXCEPT ALL: red'       =>   qw( 0  tcp  red   ))),  undef;
is    +($r->Start( 'tcp: ALL EXCEPT LOCAL'     =>   qw( 0  tcp  red   ))),  undef;

