class TechCrunchStrategy < Strategy
  URL = "http://techcrunch.com"

  def self.all
    posts = []

    doc = Nokogiri::HTML(open(URL))
    parent = doc.css('ul.river')[0]
    parent.xpath(".//li[@class='river-block']").each do |child|
      #get title
      title = child.xpath(".//h2[@class='post-title']")

      #get link
      link = child.xpath(".//h2[@class='post-title']/a")

      #get excerpt
      excerpt = child.xpath(".//p[@class='excerpt']")

      #get time
      time = child.xpath(".//div[@class='byline']/time")[0]

      techcrunch = TechCrunch.new(title: title.text, link: link[0]['href'], excerpt: excerpt.text)
      techcrunch.published_at = time['datetime']
      techcrunch.source = :techcrunch

      posts << techcrunch
    end

    posts
  end
end
