# Puppet manifest for my PHP dev machine
class phpdevweb{
	require yum
	include iptables
	#include rpmforge
	include misc
	include httpd
	include phpdev
	include db
	include php	
	include phpmyadmin
}
include phpdevweb