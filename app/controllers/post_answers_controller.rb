class PostAnswersController < ApplicationController
  def index
    @post = Post.find_by(random_id: params[:post_random_id])
    if session[:master_post_id].present?
      if session[:master_post_id] != @post.id
        redirect_to root_path and return
      end
    else
      redirect_to root_path and return
    end
  end
  def create
    @post_answer = PostAnswer.new(create_params)
    @post_answer.post_id = Post.find_by(random_id: params[:post_random_id]).id
    @post_answer.save
    redirect_to post_answer_path(post_random_id: params[:post_random_id], id: @post_answer.id)
  end
  def show
    @post_answer = PostAnswer.find params[:id]
  end

  private

  def create_params
    params.require(:post_answer).permit(:answerd_name, :target_name, :post_random_id)
  end


end
