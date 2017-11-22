class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_url, notice: '更新に成功しました'
    else
      flash.now.alert = '更新に失敗しました'
      render :edit
    end
  end

  helper_method :current_user

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
