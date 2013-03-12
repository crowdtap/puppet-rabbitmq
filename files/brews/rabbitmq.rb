require 'formula'

class Rabbitmq < Formula
  homepage 'http://rabbitmq.org/'
  url 'http://www.rabbitmq.com/releases/rabbitmq-server/v2.8.7/rabbitmq-server-generic-unix-2.8.7.tar.gz'
  sha1 '16965e5c3486f6882df363064707777fc4cbbe2e'

  version '2.8.7-boxen1'

  depends_on 'erlang'

  def install
    # Install the base files
    prefix.install Dir['*']

    # Replace the SYS_PREFIX for things like rabbitmq-plugins
    inreplace((sbin + 'rabbitmq-defaults'), 'SYS_PREFIX=${RABBITMQ_HOME}', "SYS_PREFIX=#{HOMEBREW_PREFIX}")

    # Set the RABBITMQ_HOME in rabbitmq-env
    inreplace((sbin + 'rabbitmq-env'), 'RABBITMQ_HOME="${SCRIPT_DIR}/.."', "RABBITMQ_HOME=#{prefix}")
  end
end
