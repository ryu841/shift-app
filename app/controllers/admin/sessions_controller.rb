# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  def guest_sign_in
    admin = Admin.guest
    sign_in admin
    flash[:notice] = I18n.t('flash.sessions.guest_admin_sign_in')
    redirect_to shifts_path
  end
end
