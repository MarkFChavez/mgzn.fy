class TechCrunch
  attr_accessor :title, :link, :excerpt, :source

  def initialize(attrs = {})
    attrs.each { |k, v| send("#{k}=", v) }
  end
end
