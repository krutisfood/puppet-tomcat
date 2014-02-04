# Installs and manages tomcat
class tomcat (
  $manage_service = false
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