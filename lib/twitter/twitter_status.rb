class TwitterStatus

  attr_reader :handle, :attributes

  def initialize(handle, attributes)
    @handle     = handle
    @attributes = attributes
  end

  def screen_name
    attributes['user']['screen_name']
  end

  def text
    attributes['text']
  end

  def time
    attributes['created_at']
  end

  def formatted_status
    "@#{screen_name}: #{text} => #{time}"
  end
end
