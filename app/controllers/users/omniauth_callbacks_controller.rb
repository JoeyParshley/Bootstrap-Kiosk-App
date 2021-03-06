class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def auth_callback
    user = User.from_omniauth(request.env['omniauth.auth'])

    if user.persisted?
      flash.notice = t 'general.facebook_login.success'
      sign_in_and_redirect user, event: :authentication
    else
      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  alias :constantcontact :auth_callback

end
