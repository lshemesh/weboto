class TwitterPlugin
  include Cinch::Plugin

  match /tweet ([^\s]+)/

  def execute(m, handle)
    if handle
      Rails.logger.info("Twitter plugin firing for handle #{handle}")

      TwitterStatusFetcher.new(handle).statuses.each do |status|
        m.reply status.formatted_status
      end
    else
      m.reply "Please provide a handle like: !tweets WeWork"
    end
  end
end
