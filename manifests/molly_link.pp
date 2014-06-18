define molly::molly_link ($conf = $title,) {
  file { "/usr/sbin/${conf}":
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    mode    => '0750',
    target  => '../share/molly-guard/shutdown',
    require => Package[$molly::params::package],
  }
}