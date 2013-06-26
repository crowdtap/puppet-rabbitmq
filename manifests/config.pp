# Config vars and files for rabbitmq.
#
# Usage:
#
#     include rabbitmq::config
class rabbitmq::config {
  require boxen::config

  $configdir      = "${boxen::config::configdir}/rabbitmq"
  $configfile     = "${configdir}/rabbitmq.config"
  $enabledplugins = "${configdir}/enabled_plugins"
  $datadir        = "${boxen::config::datadir}/rabbitmq"
  $executable     = "${boxen::config::home}/homebrew/sbin/rabbitmq-server"
  $logdir         = "${boxen::config::logdir}/rabbitmq"
  $port           = 15672
  $mgmt_port      = 25672
}
