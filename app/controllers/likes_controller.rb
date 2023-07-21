class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:id]

    if @like.save 
      redirect_to(request.referrer || root_path)
    else
      render :new
    end
  end
end
