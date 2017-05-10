class CallbacksController < ApplicationController

  def google
    user = User.find_or_create_agent(google_user_params)
    sign_in user
    return redirect_to root_path
  end

  def facebook
    user = User.find_or_create_agent(facebook_user_params)
    sign_in user
    return redirect_to root_path
  end

  private
  def auth_params
    request.env["omniauth.auth"]
  end

  def generate_password
    random_password = Devise.friendly_token.first(8)
    {
      password: random_password,
      password_confirmation: random_password
    }
  end

  def facebook_user_params
    {
      email: auth_params.info.email,
      nombre: auth_params.info.first_name,
      apellido: auth_params.info.last_name,
      rol: 2
    }.merge(
      generate_password
    )
  end

  def google_user_params
    {
      email: auth_params.info.email,
      nombre: auth_params.info.first_name,
      apellido: auth_params.info.last_name,
      rol: 2
    }.merge(
      generate_password
    )
  end

end
