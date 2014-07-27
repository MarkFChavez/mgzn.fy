class Medium < Post
  attr_accessor :title, :link, :excerpt, :author_image, :author_name, :reading_time

  def initialize(attrs = {})
    attrs.each { |k, v| send("#{k}=", v) }
  end
end
