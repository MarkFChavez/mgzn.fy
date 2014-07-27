class TechCrunch
  attr_accessor :title, :link, :excerpt, :source, :published_at, :image

  def initialize(attrs = {})
    attrs.each { |k, v| send("#{k}=", v) }
  end
end
