class phpdev {

  package { "libxml2-devel":
  ensure  => present,
  }

  package { "libXpm-devel":
  ensure  => present,
  }

  package { "gmp-devel":
  ensure  => present,
  }

  package { "libicu-devel":
  ensure  => present,
  }

  package { "t1lib-devel":
  ensure  => present,
  }

  package { "aspell-devel":
  ensure  => present,
  }

  package { "openssl-devel":
  ensure  => present,
  }

  package { "bzip2-devel":
  ensure  => present,
  }

  package { "libcurl-devel":
  ensure  => present,
  }

  # package { "libjpeg-devel":
  # ensure  => present,
  # }

  package { "libvpx-devel":
  ensure  => present,
  }

  package { "libpng-devel":
  ensure  => present,
  }

  package { "freetype-devel":
  ensure  => present,
  }

  package { "readline-devel":
  ensure  => present,
  }

  package { "libtidy-devel":
  ensure  => present,
  }

  package { "libxslt-devel":
  ensure  => present,
  }
}