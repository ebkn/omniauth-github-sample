class SessionsController < ApplicationController
  def callback
    auth = request.env['omniauth.auth']
    if user = User.find_by_provider_and_uid(
        auth['provider'],
        auth['uid']
      )
      redirect_to root_url
    else
      user = User.create_with_omniauth(auth)
      redirect_to edit_user_path
    end

    session[:user_id] = user.id
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
