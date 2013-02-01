class mysql {

  package { "mysql-server":
    ensure  => present,
  }

  package { "mysql":
    ensure  => present,
  }

  service { "mysqld":
    ensure => running, 
    require => Package["mysql-server"]
  }

}