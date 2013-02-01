# Puppet manifest for my PHP dev machine
class phpdevweb{
	require yum
	include iptables
	#include rpmforge
	include misc
	include httpd
	include phpdev
	include mysql
	include php	
	include phpmyadmin
}
include phpdevweb