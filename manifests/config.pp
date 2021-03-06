# Define molly::config
class molly::config {
  file { '/etc/molly-guard/rc':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/rc.erb"),
    require => Package[$molly::params::package],
  }

  file { '/usr/share/molly-guard/shutdown':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => "puppet:///modules/${module_name}/shutdown",
    require => Package[$molly::params::package],
  }
  
   file { "/etc/molly-guard/run.d/10-print-message":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => "puppet:///modules/${module_name}/10-print-message",
    require => Package[$molly::params::package],
  }
  
  file { "/etc/molly-guard/run.d/30-query-hostname":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => "puppet:///modules/${module_name}/${lsbdistrelease}.30-query-hostname",
    require => Package[$molly::params::package],
  }

  molly::molly_link { 'shutdown': }

  molly::molly_link { 'poweroff': }

  molly::molly_link { 'reboot': }

  molly::molly_link { 'halt': }
  
}
