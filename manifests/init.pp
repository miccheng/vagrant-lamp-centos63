# Puppet manifest for my PHP dev machine
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
class phpdevweb
{
	File {
		owner   => "root",
		group   => "root",
		mode    => 644,
		require => Package["httpd"],
		notify  => Service["httpd"]
	}

	exec {
		'yum-update':
			command => '/usr/bin/yum -y update',
			require => Exec["grap-epel"]
			;
		"grap-epel":
			command => "/bin/rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm",
			creates => "/etc/yum.repos.d/epel.repo",
			alias   => "grab-epel"
			;
	}
	
	package {[
			"iptables",
			"vim-enhanced",
			"git",
			"httpd",
			"httpd-devel",
			"mod_ssl",

		]: 
			ensure => present;
	}

	service {
		"iptables":
			require    => Package["iptables"],
			hasstatus  => true,
			status     => "true",
			hasrestart => false
			;
		"httpd":
			name      => 'httpd',
			require   => Package["httpd"],
			ensure    => running,
			enable    => true
			;
	}

	file {
		"/etc/sysconfig/iptables":
			owner   => "root",
			group   => "root",
			mode    => 600,
			replace => true,
			ensure  => present,
			source  => "/vagrant/files/iptables.txt",
			require => Package["iptables"],
			notify  => Service["iptables"]
			;
		"/etc/httpd/conf.d/vhost.conf":
			replace => true,
			ensure  => present,
			source  => "/vagrant/files/httpd/conf.d/vhost.conf"
			;
		"/etc/httpd/vhosts":
		    ensure => "directory"
		    ;
		"/etc/httpd/vhosts":
			replace => true,
			ensure  => present,
			source  => "/vagrant/files/httpd/vhosts",
			recurse => true
			;
	}

	# Uncomment if you want to specify SSL vhosts and SSL folder for your SSL files.

	# file { "/etc/httpd/vhosts_ssl":
	#     replace => true,
	#     ensure  => present,
	#     source  => "/vagrant/files/httpd/vhosts_ssl",
	#     recurse => true,
	#   }
	# file { "/etc/httpd/ssl":
	#     replace => true,
	#     ensure  => present,
	#     source  => "/vagrant/files/httpd/ssl",
	#     recurse => true,
	#   }

	class { 'mysql': }
	class { 'mysql::server': 
		config_hash => { 'root_password' => 'media1' }
	}

	package { [
		"php",
		"php-cli",
		"php-common",
		"php-devel",
		"php-gd",
		"php-mcrypt",
		"php-intl",
		"php-mbstring",
		"php-mysql",
		"php-pdo",
		"php-pear",
		"php-soap",
		"php-xml",
		"uuid-php",
		"php-pecl-memcache",
		"php-pecl-xdebug",
		"php-pecl-apc",
		"phpMyAdmin",
	]:
		ensure  => present,
		require => Exec["grab-epel"]
	}

	exec { "xhprof":
		command => "/usr/bin/pecl install xhprof-beta",
		creates => "/usr/lib64/php/modules/xhprof.so",
		require => Exec["grab-epel"]
	}

	file { 
		"/etc/php.d/xhprof.ini":
			replace => true,
			ensure  => present,
			source  => "/vagrant/files/php.d/xhprof.ini"
			;
		"/etc/php.ini":
			replace => true,
			ensure  => present,
			source  => "/vagrant/files/php.ini"
			;
		"/etc/httpd/conf.d/phpMyAdmin.conf":
			replace => true,
			ensure  => present,
			source  => "/vagrant/files/httpd/conf.d/phpMyAdmin.conf"
			;
		"/etc/phpMyAdmin/config.inc.php":
			replace => true,
			ensure  => present,
			source  => "/vagrant/files/phpmy_admin_config.inc.php",
			require => Package["phpMyAdmin"]
			;
	}

	# PHP TDD Libraries
	# exec {
	# 	"pear-phpunit-discover":
	# 		command => "/usr/bin/pear config-set auto_discover 1",
	# 		require => Package["php-pear"]
	# 		;
	# 	"pear-phpunit":
	# 		command => "/usr/bin/pear install phpunit/PHPUnit",
	# 		creates => "/usr/bin/phpunit",
	# 		require => Exec["pear-phpunit-discover"]
	# 		;
	# 	"pear-phpunit-skeleton-generator":
	# 		command => "/usr/bin/pear install phpunit/PHPUnit_SkeletonGenerator",
	# 		creates => "/usr/bin/phpunit-skelgen",
	# 		require => Exec["pear-phpunit-discover"]
	# 		;
	# 	"pear-phpunit-selenium":
	# 		command => "/usr/bin/pear install phpunit/PHPUnit_Selenium",
	# 		creates => "/usr/share/pear/PHPUnit/Extensions/Selenium2TestCase.php",
	# 		require => Exec["pear-phpunit-discover"]
	# 		;
	# 	"pear-phpunit-story":
	# 		command => "/usr/bin/pear install phpunit/PHPUnit_Story",
	# 		creates => "/usr/share/pear/PHPUnit/Extensions/Story/Step.php",
	# 		require => Exec["pear-phpunit-discover"]
	# 		;
	# 	"pear-phpunit-dbunit":
	# 		command => "/usr/bin/pear install phpunit/DbUnit",
	# 		creates => "/usr/share/pear/PHPUnit/Extensions/Database/DefaultTester.php",
	# 		require => Exec["pear-phpunit-discover"]
	# 		;
	# }

}
include phpdevweb