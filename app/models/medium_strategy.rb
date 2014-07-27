class MediumStrategy < Strategy
  URL = "https://medium.com"

  def self.all
    posts = []

    doc = Nokogiri::HTML(open(URL))
    doc.css("ul.bucket-content li.bucket-item").each do |bucket|
      #get title
      title = bucket.xpath(".//h3[@class='postItem-title']").text

      #get link
      link = bucket.xpath(".//h3/a")[0]['href']

      #get excerpt
      excerpt = bucket.xpath(".//a[@class='postItem-snippet']/p")[0].text

      #get image
      image = bucket.xpath(".//img")[0]

      #get author name
      author = bucket.xpath(".//span[@class='avatar-span avatar-span--iconWithName']")

      #get reading time
      reading_time = bucket.xpath(".//span[@class='readingTime']")

      medium = Medium.new(title: title, link: link, excerpt: excerpt)
      medium.source = :medium
      medium.author_image = image['src'] if image
      medium.author_name = author.text if author
      medium.reading_time = reading_time.text
      # medium.published_at = Time.now.to_s

      posts << medium
    end

    posts
  end
end
