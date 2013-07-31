class platform_services_dns(
  $interfaces = {
    'serv' => 'eth0',
    'sync' => 'eth1',
    'stor' => 'eth2',
  }
) {
  # fail if interfaces is not a hash and does not contain the keys serv, sync and stor
  unless (is_hash($interfaces) and has_key($interfaces, 'serv') and has_key($interfaces, 'sync') and has_key($interfaces, 'stor')) {
    fail("class parameter 'interfaces' must be a hash with keys 'serv', 'sync' and 'stor'")
  }

  $macaddress_serv = getvar("::macaddress_${interfaces['serv']}")
  $macaddress_sync = getvar("::macaddress_${interfaces['sync']}")
  $macaddress_stor = getvar("::macaddress_${interfaces['stor']}")

  $ipaddress_serv = getvar("::ipaddress_${interfaces['serv']}")
  $ipaddress_sync = getvar("::ipaddress_${interfaces['sync']}")
  $ipaddress_stor = getvar("::ipaddress_${interfaces['stor']}")
}