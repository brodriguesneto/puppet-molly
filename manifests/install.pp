# Class: molly::install
class molly::install {
  package { $molly::params::package:
    ensure => $molly::package_ensure,
    before => Class['molly::config']
  }
}
