class ProfileController < ApplicationController
  layout "site"
  before_action :authenticate_user!
  before_action :set_user
  before_action :verify_password, only: [:update]
  before_action :verify_authorized, except: [ :show ]

  def show 
  end

  def edit
    @nicknames = User.all.map(&:nickname)
  end 

  def update
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: 'ok!'
    else
      render :edit, notice: 'no!'
    end
  end

  private
  def user_params
      params.require(:user).permit(:nickname, :name, :email, :url_image, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by!(nickname: params[:nickname])
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].extract!(:password, :password_confirmation)
    end
  end

  def verify_authorized
    authorize @user
  end
end
