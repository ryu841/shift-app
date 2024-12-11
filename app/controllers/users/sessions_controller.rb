class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    flash[:notice] = I18n.t('flash.sessions.guest_user_sign_in')
    redirect_to shifts_path
  end
end
