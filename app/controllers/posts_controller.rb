class PostsController < ApplicationController
  def feed
    @posts = Post.order("id DESC").last(20)
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
end
