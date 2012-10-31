require 'cinch'

class Leftronic
  include Cinch::Plugin

  match 'leftronic'
  def execute(m) #default method name for !hello command
    m.reply "Hello!!sdfasdf!!!, #{m.user.nick}"
  end
end
