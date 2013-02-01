class phpmyadmin {

  File {
    owner   => "root",
    group   => "root",
    mode    => 644,
    require => Package["httpd"],
    notify  => Service["httpd"]
  }

  package { "phpMyAdmin":
    ensure  => present,
  }

  file { "/etc/httpd/conf.d/phpMyAdmin.conf":
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/httpd/conf.d/phpMyAdmin.conf",
  }

  file { "/etc/phpMyAdmin/config.inc.php":
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/phpmy_admin_config.inc.php",
    require => Package["phpMyAdmin"]
  }

}