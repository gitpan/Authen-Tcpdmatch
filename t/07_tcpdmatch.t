
use Test::More;
use Authen::Tcpdmatch::Tcpdmatch;

BEGIN { plan tests => 6 }

my $dir  = $0 =~ /^t/ ? 't'  : '.' ;


ok     tcpdmatch(   'ftp'  ,   'red'      , $dir  );
ok     tcpdmatch(   'tcp'  ,   'red'      , $dir  );
ok     tcpdmatch(   'ssh'  ,   'red'      , $dir  );
ok     tcpdmatch(   'zebra',   'red'      , $dir  );
is   +(tcpdmatch(   'irc'  ,   'red'      , $dir  )),  undef ;
is   +(tcpdmatch(   'zebra',   'red.com'  , $dir  )),  undef ;


