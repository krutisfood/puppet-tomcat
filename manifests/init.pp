# Installs and manages tomcat
# [cache_dir] is where downloaded files go
class tomcat (
  $manage_service = $::tomcat::params::manage_service,
  $install_dir    = $::tomcat::params::install_dir,
  $user           = $::tomcat::params::user,
  $cache_dir      = $::tomcat::params::cache_dir
  # version
  # ensure running
  # enable
  # source
  #
) {
  include tomcat::params

  $instance     = $title
  $install_dir  = "${tomcat::base_dir}/${instance}"

  include tomcat::install
  include tomcat::config
  if $manage_service {
    include tomcat::service
  }
}