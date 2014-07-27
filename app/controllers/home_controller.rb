class HomeController < ApplicationController
  def index
    @posts = posts
  end

  private

  def posts
    posts = []

    doc = Nokogiri::HTML(open(mashable))
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

    url = "http://techcrunch.com"
    doc = Nokogiri::HTML(open(url))
    parent = doc.css('ul.river')[0]
    parent.xpath(".//li[@class='river-block']").each do |child|
      #get title
      title = child.xpath(".//h2[@class='post-title']")

      #get link
      link = child.xpath(".//h2[@class='post-title']/a")

      #get excerpt
      excerpt = child.xpath(".//p[@class='excerpt']")

      techcrunch = TechCrunch.new(title: title.text, link: link[0]['href'], excerpt: excerpt.text)
      techcrunch.source = :techcrunch

      posts << techcrunch
    end

    # posts.sort_by { |mashable| mashable.published_at.reverse }
    posts
  end
end
