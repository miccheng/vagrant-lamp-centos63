# Puppet manifest for my PHP dev machine
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
class phpdevweb{
	require yum
	include iptables
	#include rpmforge
	include misc
	include httpd
	#include phpdev
	include db
	include php	
	include phpmyadmin
	#include phptdd
}
include phpdevweb