class MashableStrategy < Strategy
  URL = "http://mashable.com"

  def self.all
    posts = []

    doc = Nokogiri::HTML(open(URL))
    content =  doc.css("div.column-content")
    content.children.each do |article|
      #get title
      nokogiri_title = article.css('h1')[0]
      title = nokogiri_title.text

      #get link
      nokogiri_link = nokogiri_title.css('a')[0]
      link = nokogiri_link['href']
  
      #get excerpt
      nokogiri_excerpt = article.css('p')[0]
      excerpt = nokogiri_excerpt.text

      nokogiri_time = article.css('time')[0]
      time = nokogiri_time['datetime']

      mashable = Mashable.new(title: title, link: link, excerpt: excerpt)
      mashable.source = :mashable
      mashable.published_at = time

      posts << mashable
    end

    posts
  end
end
