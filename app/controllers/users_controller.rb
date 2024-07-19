class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users , status: :ok
  end

  def show
    puts(params)
    @user = User.find(params[:id])
    # render json: @user, status: :ok
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
    
end
