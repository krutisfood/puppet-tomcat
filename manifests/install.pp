# Install tomcat
class tomcat::install (
) inherits tomcat {
  $requires = Package['wget']
  $url = "http://archive.apache.org/dist/tomcat/tomcat-${tomcat::params::release}/v${tomcat::params::version}/bin/${tomcat::params::filename}"

  wget::fetch {
    $tomcat::params::filename:
      source      => $url,
      destination => "${tomcat::cache_dir}/${tomcat::params::filename}",
      require     => Package['wget'];
  }

  file {
    "${tomcat::install_dir}/tomcat":
      ensure => link,
      target => "${tomcat::install_dir}/${tomcat::params::extracted_dir}";
  }

  exec { "install-${tomcat::instance}":
    creates => "${tomcat::install_dir}/apache-tomcat-${tomcat::params::version}",
    command => "/bin/tar -C '${tomcat::install_dir}' -x -f ${tomcat::cache_dir}/${tomcat::params::filename}",
    require => [Wget::Fetch[$tomcat::params::filename], File[$tomcat::install_dir]]
  }
}
