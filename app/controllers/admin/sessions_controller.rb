# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  def guest_sign_in
    admin = Admin.guest
    sign_in admin
    flash[:notice] = "管理者ゲストユーザーとしてログインしました。"
    redirect_to shifts_path
  end
end
