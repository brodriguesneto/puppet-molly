define molly::molly_run ($conf = $title,) {
  file { "/etc/molly-guard/run.d/${conf}":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("molly/${conf}.erb"),
    require => Package[$molly::params::package],
  }
}