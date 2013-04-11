class HelpPlugin
  include Cinch::Plugin

  match /help/

  def execute(m)
    m.reply "Domo arigato, Mr. Weboto! Learn more about me here: http://is.gd/raYkNF"
  end
end
