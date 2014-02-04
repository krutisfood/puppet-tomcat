# Defaults
class tomcat::params {
  $base_dir       = '/opt'
  $release        = 6
  $version        = '6.0.35'
  $filename       = "apache-tomcat-${version}.tar.gz"
  $cache_dir      = "${base_dir}/cachedir"
  $manage_service = false
  $install_dir    = '/opt/tomcat'
  $user           = 'tomcat'
}