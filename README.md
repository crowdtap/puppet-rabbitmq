# RabbitMQ Puppet Module for Boxen

## Usage

```puppet
include rabbitmq
```

## Required Puppet Modules

* boxen
* homebrew
* stdlib

### Environment

Once installed, you can access the following variables in your environment, projects, etc:

* BOXEN_RABBITMQ_PORT: the configured rabbitmq port
* BOXEN_RABBITMQ_URL: the URL for rabbitmq, including localhost & port

#### Ruby

```ruby
$rabbitmq = RabbitMQ.new(:host => '127.0.0.1', :port => ENV['BOXEN_RABBITMQ_PORT'] || '5672')
```
