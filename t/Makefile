.PHONY:    $(shell ls)
.SILENT:

PERL = /usr/bin/perl

OPTS     =  -lw -Mblib
MODULES  =  -Mstrict  -MData::Dumper -MCarp

#  00_basic.t       01_byname.t     02_wildcard.t
#  03_ip_dot.t      04_dot_ip.t     05_netmask.t
#  06_multiline.t   07_tcpdmatch.t

all:  07_tcpdmatch.t
#all:  01_byname.t
#all: 06_multiline.t
#all: 00_basic.t
#all: del

del t*t 0*t:
	$(PERL) $(OPTS) $(MODULES) $@
doc:
	perldoc -F ../lib/Authen/Tcpdmatch/Tcpdmatch.pm
