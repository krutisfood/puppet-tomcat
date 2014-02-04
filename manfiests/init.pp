# Installs and manages tomcat
class tomcat (
  $manage_service = false
) inherits tomcat::params {
  $instance = $title
  $install_dir = "${base_dir}/${instance}"

  include tomcat::install
  include tomcat::config
  if $manage_service {
    include tomcat::service
  }
}