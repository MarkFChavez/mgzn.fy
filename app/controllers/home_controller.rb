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

      post = Post.new(title: title, link: link, excerpt: excerpt)
      post.source = :mashable
      post.published_at = time

      posts << post
    end

    posts.sort_by { |post| post.published_at.reverse }
  end
end
