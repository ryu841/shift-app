# frozen_string_literal: true

class Admin::RegistrationsController < Devise::RegistrationsController
  before_action :check_if_admin_exists

  private

  def check_if_admin_exists
    if Admin.count >= 1
      flash[:alert] = '管理者はすでに作成されています。'
      redirect_to root_path
    end
  end
end
