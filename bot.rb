require 'autoreload'
require 'cinch'
require 'require_all'

autoreload(:interval => 1, :verbose => true) do
  require_all 'plugins'
end

class LogBot
  def self.run
    bot = Cinch::Bot.new do
      configure do |c|
        c.nick = "the-amazing-logb"
        c.server = "irc.freenode.org"
        c.channels = ["#irclog-bots"]
        c.plugins.plugins = [Hello, Leftronic]
      end
    end

    Thread.new { RandomStringGenerator.new(bot).start }
    bot.start
  end
end
