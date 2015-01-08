# Class: molly::params
class molly::params {
  case $::operatingsystem {
    'Ubuntu' : {
      case $::lsbdistrelease {
        /(12.04|14.04|14.10)/ : {
          $package = 'molly-guard'
        }
        default         : {
          case $::lsbdistrelease {
            default : { fail("Unsupported Ubuntu suite: ${::lsbdistrelease}") }
          }
        }
      }
    }
    default  : {
      case $::operatingsystem {
        default : { fail("Unsupported operating system: ${::operatingsystem}") }
      }
    }
  }
}
