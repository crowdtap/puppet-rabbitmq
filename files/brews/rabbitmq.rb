require 'formula'

class Rabbitmq < Formula
  homepage 'http://rabbitmq.org/'
  url 'https://www.rabbitmq.com/releases/rabbitmq-server/v3.5.6/rabbitmq-server-mac-standalone-3.5.6.tar.gz'
  sha1 'da35427cc9b153dc2158ca0b4b9f8ca334164a246943dad0cbe94e4de776dff4'

  version '3.5.6'

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
