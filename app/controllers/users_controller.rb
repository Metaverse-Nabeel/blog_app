class UsersController < ApplicationController
  def index
    @users = if params[:search]
               User.where('name LIKE ?', "%#{params[:search]}%")
             else
               User.all
             end
    render 'index'
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end
end
