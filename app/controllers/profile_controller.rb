class ProfileController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :verify_password, only: [:update]

  def index
    if params[:nickname]
      if User.exists?(nickname: "#{params[:nickname]}")
        @user = User.find_by(nickname: "#{params[:nickname]}")
      else
        redirect_to profile_index_path
      end
    else
      @user = current_user
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_index_path, notice: 'ok!'
    else
      render :edit, notice: 'no!'
    end
  end

  def destroy
  end

  private
  def user_params
      params.require(:user).permit(:nickname, :name, :email)
  end

  def set_user
      @user = User.find(params[:id])
  end

  def check_nickname
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].extract!(:password, :password_confirmation)
    end
  end
end
