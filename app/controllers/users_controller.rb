class UsersController < ApplicationController
  before_action :check_for_admin, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def update
    user = User.find params[:id]
    user.update user_params
    if params['user']['image']
      cloudinary = Cloudinary::Uploader.upload(params['user']['image'])
      user.image = cloudinary['url']
    else
      user.image = 'https://www.goaltos.com/wp-content/uploads/sites/4559/2018/01/avatar-1577909_960_720.png'

    end
    user.save
    redirect_to user
  end

  # def edit
  #   @user = User.find params[:id]
  # end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path # Redirect to home if the account is valid
    else
      render :new # Let them retry the form again
    end
  end

  def edit
    @user = @current_user
  end

  def destroy
    item = Item.find params[:id]
    item.destroy
    redirect_to items_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
