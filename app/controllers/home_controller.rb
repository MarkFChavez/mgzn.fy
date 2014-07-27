class HomeController < ApplicationController
  def index
    @posts = posts
  end

  private

  def posts
    posts = []

    mashable = MashableStrategy.all
    techcrunch = TechCrunchStrategy.all

    posts << mashable
    posts << techcrunch

    posts.flatten!.sort_by { |post| Date.parse(post.published_at) }.reverse
  end
end
