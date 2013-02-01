class rpmforge {
  exec {
    "/usr/bin/wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm":
    alias   => "grab-rpmforge",
  }

  exec {
    "/bin/rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt":
    alias   => "import-key",
    require => Exec["grab-rpmforge"],
  }

  exec {
    "/bin/rpm -i rpmforge-release-0.5.2-2.el6.rf.*.rpm":
    alias   => "install-rpmforge",
    require => Exec["import-key"],
  }

  package { "libmcrypt-devel":
  ensure  => present,
    require => Exec["install-rpmforge"]
  }
}