require 'cinch'

class RandomStringGenerator
  def initialize(bot)
    @bot = bot
  end

  def start
    while true
      sleep 1
      @bot.handlers.dispatch(:random_string, nil, "This is a random string #{Kernel.rand}")
    end
  end
end

class Hello
  include Cinch::Plugin

  match 'hello'
  def execute(m) #default method name for !hello command
    m.reply "Hello, #{m.user.nick}"
  end

  match 'hi', method: :hi
  def hi(m) #not default method
    m.reply "Hi!!!, #{m.user.nick}"
  end

  listen_to :random_string
  def listen(m, string)
    Channel("#irclog-bots").send string
  end
end

