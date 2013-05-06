class platform_services::nodes {
  include platform_services

  node /^puppet(-\w+)?(-?\d+)?\./ {
    #unless $::platform_services_puppet::master::disable {
      include ::platform_services_puppet::master
    #}
    #include ::platform_services_cloudstack::controller
    include ::platform_services::base
  }
  node /^dns(-\w+)?(-?\d+)?\./ {
    include ::platform_services_dns::server
    include ::platform_services::base
  }
  node /monitor(-\w+)?(-?\d+)?\./ {
    include ::platform_services_icinga::server
    include ::platform_services::base
  }
  node /^log(-\w+)?(-?\d+)?\./ {
    include ::platform_services_graylog2::server
    include ::platform_services::base
  }
  node /^patch(-\w+)?(-?\d+)?\./ {
    include ::platform_services_pakiti::server
    include ::platform_services::base
  }
  node /^haproxy(-\w+)?(-?\d+)?\./ {
    include ::platform_services_haproxy::server
    include ::platform_services::base
  }
}
