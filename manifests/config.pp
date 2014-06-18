# Define molly::config
class molly::config {
  file { '/etc/molly-guard/rc':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('molly/rc.erb'),
    require => Package[$molly::params::package],
  }

  file { '/usr/share/molly-guard/shutdown':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/molly/shutdown',
    require => Package[$molly::params::package],
  }
  
  molly::molly_run { '30-query-hostname': }

  molly::molly_run { '10-print-message': }

  molly::molly_link { 'shutdown': }

  molly::molly_link { 'poweroff': }

  molly::molly_link { 'reboot': }

  molly::molly_link { 'halt': }
}
