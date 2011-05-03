
class tomcat {
  include tomcat::package
  include tomcat::service
}

class tomcat::package {

  $pkg = $operatingsystem ? {
    debian => "tomcat6",
  }

  package { $pkg :
    ensure => installed,
  }

}

class tomcat::service {

  $srv = $operatingsystem ? {
    debian => "tomcat6",
  }

  service { $srv :
    enable     => true,
    ensure     => running,
    hasrestart => true,
    hasstatus  => true,
    require    => Class["tomcat::package"],
  }
  
}
