# Class: molly
class molly ($ensure = 'present', $autoupgrade = false, $always_query_hostname = true,) inherits molly::params {
  case $ensure {
    /(present)/ : {
      $file_ensure = 'present'

      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }

    }
    /(absent)/  : {
      $file_ensure = 'absent'
      $package_ensure = 'absent'
    }
    default     : {
      fail('ensure parameter must be present or absent')
    }
  }
  include molly::install, molly::config
  Class['molly::install'] -> Class['molly::config']
}
