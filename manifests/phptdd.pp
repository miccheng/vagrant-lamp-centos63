class phptdd
{
	exec { "pear-phpunit-discover":
    command => "/usr/bin/pear config-set auto_discover 1",
    require => Package["php-pear"]
  }

  exec { "pear-phpunit":
    command => "/usr/bin/pear install phpunit/PHPUnit",
    creates => "/usr/bin/phpunit",
    require => Exec["pear-phpunit-discover"]
  }

  exec { "pear-phpunit-skeleton-generator":
    command => "/usr/bin/pear install phpunit/PHPUnit_SkeletonGenerator",
    creates => "/usr/bin/phpunit-skelgen",
    require => Exec["pear-phpunit-discover"]
  }

  exec { "pear-phpunit-selenium":
    command => "/usr/bin/pear install phpunit/PHPUnit_Selenium",
    creates => "/usr/share/pear/PHPUnit/Extensions/Selenium2TestCase.php",
    require => Exec["pear-phpunit-discover"]
  }

  exec { "pear-phpunit-story":
    command => "/usr/bin/pear install phpunit/PHPUnit_Story",
    creates => "/usr/share/pear/PHPUnit/Extensions/Story/Step.php",
    require => Exec["pear-phpunit-discover"]
  }

  exec { "pear-phpunit-dbunit":
    command => "/usr/bin/pear install phpunit/DbUnit",
    creates => "/usr/share/pear/PHPUnit/Extensions/Database/DefaultTester.php",
    require => Exec["pear-phpunit-discover"]
  }

}