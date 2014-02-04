class tomcat::install (
) inherits tomcat {
  $requires = Package['wget']
  $url = "http://archive.apache.org/dist/tomcat/tomcat-${release}/v${version}/bin/${filename}"
  wget::fetch {
    'download apache tomcat':
      source      => $url,
      destination => $cache_dir,
      require     => Package['wget'];
  }

  exec { "install-"}
  exec { "install-"}
}