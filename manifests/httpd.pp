class httpd {

  File {
    owner   => "root",
    group   => "root",
    mode    => 644,
    require => Package["httpd"],
    notify  => Service["httpd"]
  }

  package { "httpd":
    ensure => present
  }

  package { "httpd-devel":
    ensure  => present
  }

  package { "mod_ssl":
    ensure  => present
  }

  service { 'httpd':
    name      => 'httpd',
    require   => Package["httpd"],
    ensure    => running,
    enable    => true
  }

  file { "/etc/httpd/conf.d":
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/httpd/conf.d",
    recurse => true,
  }

  file { "/etc/httpd/vhosts":
    ensure => "directory",
  }
  # file { "/etc/httpd/vhosts_ssl":
  #     ensure => "directory",
  #   }
  # file { "/etc/httpd/rules":
  #     ensure => "directory",
  #   }
  # file { "/etc/httpd/ssl":
  #     ensure => "directory",
  #   }
  # file { "/var/www/share":
  #   mode   => 777,
  #   ensure => "directory",
  # }

  file { "/etc/httpd/vhosts":
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/httpd/vhosts",
    recurse => true,
  }

  # file { "/etc/httpd/vhosts_ssl":
  #     replace => true,
  #     ensure  => present,
  #     source  => "/vagrant/files/httpd/vhosts_ssl",
  #     recurse => true,
  #   }

  # file { "/etc/httpd/rules":
  #     replace => true,
  #     ensure  => present,
  #     source  => "/vagrant/files/httpd/rules",
  #     recurse => true,
  #   }

  # file { "/etc/httpd/ssl":
  #     replace => true,
  #     ensure  => present,
  #     source  => "/vagrant/files/httpd/ssl",
  #     recurse => true,
  #   }

}