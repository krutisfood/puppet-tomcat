# Defaults
class tomcat::params {
  $base_dir    = '/opt/atlassian'
  $release     = 6
  $version     = '6.0.35'
  $filename    = "apache-tomcat-${version}.tar.gz"
  $cache_dir   = "${base_dir}/cachedir"
}