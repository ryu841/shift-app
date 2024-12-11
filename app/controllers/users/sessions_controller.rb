class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    flash[:notice] = 'ゲストユーザーとしてログインしました。'
    redirect_to shifts_path
  end
end
