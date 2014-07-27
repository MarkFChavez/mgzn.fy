class HomeController < ApplicationController
  def index
    @posts = posts
  end

  private

  def posts
    posts = []

    mashable = MashableStrategy.all
    techcrunch = TechCrunchStrategy.all
    medium = MediumStrategy.all

    posts = [mashable, techcrunch].flatten!.sort_by do |post| 
      Date.parse(post.published_at)
    end.reverse

    posts << medium
    posts.flatten!
  end
end
