use strict;
use Test::More;
use Authen::Tcpdmatch::Grammar;

plan tests => 11;

my  Authen::Tcpdmatch::Grammar   $r : TcpdParser  ;


ok      $r->Start( 'tcp: red'                         =>   qw( 0  tcp  red  ));
is    +($r->Start( 'irc: red'                         =>   qw( 0  tcp  red  ))),  undef;
ok      $r->Start( 'tcp: ntro red'                    =>   qw( 0  tcp  red ));


is    +($r->Start( 'tcp EXCEPT tcp: red'              =>   qw( 0  tcp  red  ))),  undef;
ok      $r->Start( 'tcp EXCEPT irc, chat: red'        =>   qw( 0  tcp  red  ));
ok      $r->Start( 'tcp EXCEPT tcp EXCEPT tcp :red'   =>   qw( 0  tcp   red ));



is    +($r->Start( 'tcp: red       EXCEPT red'         =>   qw( 0  tcp  red ))),  undef;
is    +($r->Start( 'tcp: ntro red  EXCEPT red'         =>   qw( 0  tcp  red ))),  undef;
ok      $r->Start( 'tcp: ntro red  EXCEPT    '         =>   qw( 0  tcp  red ));

ok      $r->Start( "ftp: red \n tcp : red"             =>   qw( 0  tcp  red  ));
 
### Extra
is    +( $r->Start( ''                                 =>   qw( 0  tcp   red ))), undef ;

__END__
#ok      $r->Start( 'tcp  EXCEPT  : red  '             =>   qw( 0  tcp  red ));
#is    +($r->Start( 'irc EXCEPT tcp EXCEPT tcp :red'   =>   qw( 0  tcp   red ))),  undef;
#is    +($r->Start( 'irc EXCEPT irc EXCEPT tcp :red'   =>   qw( 0  tcp   red ))),  undef;
