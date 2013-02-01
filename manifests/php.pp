class php {

  File {
    owner   => "root",
    group   => "root",
    mode    => 644,
    require => Package["httpd"],
    notify  => Service["httpd"]
  }

  package { "php":
    ensure  => present,
  }

  package { "php-cli":
    ensure  => present,
  }

  package { "php-common":
    ensure  => present,
  }

  package { "php-devel":
    ensure  => present,
  }

  package { "php-gd":
    ensure  => present,
  }

  package { "php-mcrypt":
    ensure  => present,
  }

  package { "php-intl":
    ensure  => present,
  }

  package { "php-mbstring":
    ensure  => present,
  }

  package { "php-mysql":
    ensure  => present,
  }

  package { "php-pdo":
    ensure  => present,
  }

  package { "php-pear":
    ensure  => present,
  }

  package { "php-soap":
    ensure  => present,
  }

  package { "php-xml":
    ensure  => present,
  }

  package { "uuid-php":
    ensure  => present,
  }

  package { "php-pecl-memcache":
    ensure  => present,
  }

  package { "php-pecl-xdebug":
    ensure  => present,
    require => Exec["grab-epel"]
  }

  package { "php-pecl-apc":
    ensure  => present,
  }

  package { "php-xcache":
    ensure  => present,
  }

  exec { "xhprof":
    command => "/usr/bin/pecl install xhprof-beta",
    creates => "/usr/lib64/php/modules/xhprof.so",
    require => Exec["grab-epel"]
  }

  file { "/etc/php.d/xhprof.ini":
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/php.d/xhprof.ini",
  }

  file { "/etc/php.ini":
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/php.ini",
  }
}