class TopicsController < ApplicationController

  def index
    @topics = Topic.all.order(updated_at: :desc)
  end

  def create
    @topic = Topic.new(title: params[:title], user_id: @current_user.id)
    @topic.save
    redirect_to("/topics/index")
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    @posts = Post.where(topic_id: params[:id]).order(created_at: :asc)
  end

  def delete
    @topic = Topic.find_by(id: params[:id])
    @posts = Post.where(topic_id: @topic.id)
    @posts.each do |post|
      post.destroy
    end
    @topic.destroy
    redirect_to("/topics/index")
  end

end
