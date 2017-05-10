class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create

    build_resource(user_params)
    resource.password_confirmation = resource.password
    resource.save
    alert = ''

    if(resource.errors.present?)
      alert = '?alert=not-created'
      return render json: {errors:resource.errors}
    else
      sign_in resource
    end

    return redirect_to root_path + alert

  end

  protected

  def user_params
    params.permit(:nombre, :email, :apellido, :rol, :password)
  end

end
