class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :asc)
  end

  def create
    @post = Post.new(name: params[:name], content: params[:content], topic_id: params[:topic_id].to_i)
    if @post.save
      redirect_to("/topics/show/#{@post.topic_id}")
    else
      render("topics/show/#{params[:topic_id].to_i}")
    end
  end

  def delete
    @post = Post.find_by(id: params[:id])
    @post.name = "削除されました"
    @post.content = "削除されました"
    @post.save
    redirect_to("/topics/show/#{@post.topic_id}")
  end
  
end
