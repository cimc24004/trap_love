class PostsController < ApplicationController
  require "securerandom"
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(params_get)
    @post.random_id = SecureRandom.uuid
    @post.save
    session[:master_post_id] = @post.id
    redirect_to post_answers_path(@post.random_id)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(random_id: params[:random_id])
    @post_answer = PostAnswer.new
  end

  private

  def params_get
    params.require(:post).permit(:name)
  end
end
