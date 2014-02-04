# Install tomcat
class tomcat::install (
) inherits tomcat {
  $requires = Package['wget']
  $url = "http://archive.apache.org/dist/tomcat/tomcat-${tomcat::release}/v${tomcat::version}/bin/${tomcat::filename}"
  wget::fetch {
    'download apache tomcat':
      source      => $tomcat::url,
      destination => $tomcat::cache_dir,
      require     => Package['wget'];
  }

  exec { "install-${tomcat::instance}":
    creates => "${tomcat::install_dir}/apache-tomcat-${tomcat::version}",
    command => "/bin/tar -C '${tomcat::install_dir}' -x -f ${tomcat::cache_dir}/${tomcat::filename}",
    require => File[$tomcat::filename]
  }
}