class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :verify_password, only: [:update]
  before_action :verify_authorized, except: [ :show ]

  def show 
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to '/', notice: 'ok!'
    else
      render :edit, notice: 'no!'
    end
  end

  def destroy
  end

  private
  def user_params
      params.require(:user).permit(:nickname, :name, :email, :url_image, :password, :confirm_password)
  end

  def set_user
    @user = User.find_by!(nickname: params[:nickname])
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:confirm_password].blank?
        params[:user].extract!(:password, :confirm_password)
    end
  end

  def verify_authorized
    authorize @user
  end
end
