class PostsController < ApplicationController
  require "securerandom"
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(params_get)
    @post.random_id = SecureRandom.uuid
    if @post.save
      redirect_to post_answers_path(@post.random_id)
    else
      @posts = Post.all
      render "index", status: :unprocessable_entity
    end
    session[:master_post_id] = @post.id

  end



  def show
    @random_id = params[:random_id]
    @post = Post.find_by(random_id: @random_id)

    @post_answer = PostAnswer.new
  end

  private

  def params_get
    params.require(:post).permit(:name)
  end
end
