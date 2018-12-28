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
                     image_name: params[:image_name],
                     delete_flag: 0)
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

  def download
    # if Rails.env.development? or Rails.env.test?
      # @post = Post.find_by(id: params[:id])
      # file_path = @post.image_name.current_path
      # send_file(file_path)
    # else
      @post = Post.find_by(id: params[:id])
      file_name  = @post.file_name
      file_name = ERB::Util.url_encode(file_name)
      data = open("#{@post.image_name.url}")
      send_data(data.read, disposition: 'attachment', filename: file_name, type: @post.content_type,
                stream: 'true', buffer_size: '4096')
    # end
  end

  def delete
    @post = Post.find_by(id: params[:id])
    @post.delete_flag = 1
    @post.save
    redirect_to("/topics/show/#{@post.topic_id}")
  end
  
end
