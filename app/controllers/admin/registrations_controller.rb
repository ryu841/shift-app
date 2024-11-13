# frozen_string_literal: true

class Admin::RegistrationsController < Devise::RegistrationsController
  before_action :check_if_admin_exists

  private

  def check_if_admin_exists
    return unless Admin.count >= 1

    flash[:alert] = I18n.t('devise.errors.messages.one_admin_only')
    redirect_to root_path
  end
end
