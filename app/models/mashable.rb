class Mashable < Post
  attr_accessor :title, :link, :excerpt, :image

  def initialize(attrs={})
    attrs.each { |k, v| send("#{k}=", v) }
  end
end
