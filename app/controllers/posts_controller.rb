class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.LikesCounter = 0
    @post.CommentsCounter = 0

    if @post.save
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
