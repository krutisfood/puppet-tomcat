# Manages tomcat service
class tomcat::service {
  $requires = Class['tomcat::install']

  service {'':
  }
}