
use Test::More;
use Authen::Tcpdmatch::Tcpdmatch;

BEGIN { plan tests => 6 }

my $dir  = $0 =~ /^t/ ? 't'  : '.' ;


ok     tcpdmatch(   qw( ftp    red     ) , $dir  );
ok     tcpdmatch(   qw( tcp    red     ) , $dir  );
ok     tcpdmatch(   qw( ssh    red     ) , $dir  );
ok     tcpdmatch(   qw( zebra  red     ) , $dir  );
is   +(tcpdmatch(   qw( irc    red     ) , $dir  )),  undef ;
is   +(tcpdmatch(   qw( zebra  red.com ) , $dir  )),  undef ;


