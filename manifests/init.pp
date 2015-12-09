# Full RabbitMQ stack, including service management.
#
# Usage:
#
#     include rabbitmq
class rabbitmq {
  include homebrew
  include rabbitmq::config

  file { [
    $rabbitmq::config::configdir,
    $rabbitmq::config::datadir,
    $rabbitmq::config::logdir
  ]:
    ensure => directory
  }

  file { $rabbitmq::config::configfile:
    content => template('rabbitmq/rabbitmq.conf.erb'),
    notify  => Service['dev.rabbitmq'],
  }

  file { $rabbitmq::config::enabledplugins:
    content => template('rabbitmq/enabled_plugins.erb'),
    notify  => Service['dev.rabbitmq'],
  }

  file { "${boxen::config::envdir}/rabbitmq.sh":
    content => template('rabbitmq/env.sh.erb')
  }

  homebrew::formula { 'rabbitmq':
    before => Package['boxen/brews/rabbitmq'],
  }

  package { 'boxen/brews/rabbitmq':
    ensure => '3.5.6',
    notify => Service['dev.rabbitmq'],
  }

  file { '/Library/LaunchDaemons/dev.rabbitmq.plist':
    content => template('rabbitmq/dev.rabbitmq.plist.erb'),
    group   => 'wheel',
    notify  => Service['dev.rabbitmq'],
    owner   => 'root'
  }

  file { "${boxen::config::homebrewdir}/var/lib/rabbitmq":
    ensure  => absent,
    force   => true,
    recurse => true,
    require => Package['boxen/brews/rabbitmq']
  }

  service { 'dev.rabbitmq':
    ensure  => running
  }

  service { 'com.boxen.rabbitmq': # replaced by dev.rabbitmq
    before => Service['dev.rabbitmq'],
    enable => false
  }
}
