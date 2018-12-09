class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :asc)
  end

  def create
    @topic = Topic.find_by(id: params[:topic_id].to_i)
    @post = Post.new(name: params[:name],
                     content: params[:content],
                     topic_id: params[:topic_id].to_i,
                     user_id: params[:user_id].to_i,
                     image_name: params[:image_name])
    if @post.save
      @topic.touch
      @topic.save
      redirect_to("/topics/show/#{@post.topic_id}")
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_to("/topics/show/#{@post.topic_id}")
    end
  end

  def show_image
    @post = Post.find_by(id: params[:id])
  end

  def delete
    @post = Post.find_by(id: params[:id])
    @post.name = "削除されました"
    @post.content = "削除されました"
    @post.save
    redirect_to("/topics/show/#{@post.topic_id}")
  end
  
end
