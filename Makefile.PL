use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'		=> 'Authen::Tcpdmatch',
    'VERSION_FROM'	=> 'lib/Authen/Tcpdmatch/Tcpdmatch.pm',
    'PREREQ_PM'		=> { Test::More          => 0,
			     Attribute::Handlers => 0,
			     NetAddr::IP         => 0,
			     Parse::RecDescent   => 0,
			   }, 
    ($] >= 5.005 ?    
      (ABSTRACT_FROM    => 'lib/Authen/Tcpdmatch/Tcpdmatch.pm', 
       AUTHOR           => 'Ioannis Tambouras <ioannis@earthlink.net>') : ()),
);
