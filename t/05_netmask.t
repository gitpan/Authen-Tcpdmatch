use Test::More;
use Authen::Tcpdmatch::Grammar;

plan tests => 11;


my  Authen::Tcpdmatch::Grammar   $r : TcpdParser  ;


ok      $r->Start( 'ALL: 192.168.0.1'             =>   qw( 0  tcp   192.168.0.1  ));
is   +( $r->Start( 'ALL: 192.168.0.1'             =>   qw( 0  tcp   192.168.0.2  ))),  undef;


ok      $r->Start( 'ALL: 192.168.0.1/24'          =>   qw( 0  tcp   192.168.0.6  ));
is   +( $r->Start( 'ALL: 192.168.0.1/24'          =>   qw( 0  tcp   192.168.2.1  ))),  undef;
is   +( $r->Start( 'ALL: 999.3.0.1/24'            =>   qw( 0  tcp   192.168.2.1  ))),  undef;
is   +( $r->Start( 'ALL: 999.3.0.1/24'            =>   qw( 0  tcp   192.8.0.1    ))),  undef;
is   +( $r->Start( 'ALL: 192.168.0.1/24'          =>   qw( 0  tcp   192.168.2.1  ))),  undef;
ok      $r->Start( 'ALL: 192.168.0.1/8'           =>   qw( 0  tcp   192.168.0.1  ));


ok    $r->Start( 'ALL: 192.168.0.1/255.255.255.0' => qw( 0  tcp   192.168.0.2  ));
ok    $r->Start( 'ALL: 192.168.0.1/255.255.0.0'   => qw( 0  tcp   192.168.2.2  ));
is  +($r->Start( 'ALL: 192.168.0.1/255.255.255.0' => qw( 0  tcp   192.162.0.2  ))),  undef;

#is   +( $r->Start( 'ALL: 192.168.0.1/999'        =>  qw( 0  tcp   192.8.0.1  ))),  undef;
