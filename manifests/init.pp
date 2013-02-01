# Puppet manifest for my PHP dev machine
class mig33web{
	require yum
	include iptables
	#include rpmforge
	include misc
	include httpd
	include phpdev
	include mysql
	include php	
}
include mig33web