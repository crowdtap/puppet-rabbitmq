require 'formula'

class Rabbitmq < Formula
  homepage 'http://rabbitmq.org/'
  url 'http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.5/rabbitmq-server-generic-unix-3.1.5.tar.gz'
  sha1 'b5d1e1dc3153095888c60ae76e6883740cec1a8b'

  version '3.1.5-boxen1'

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
