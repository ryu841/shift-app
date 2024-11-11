class ShiftsController < ApplicationController
  before_action :authenticate_user!

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    # @shift.admin_id = current_user.id
    if @shift.save
      flash[:notice] = I18n.t('flash.posts.create.success')
      redirect_to root_path
    else
      flash[:alert] = I18n.t('flash.posts.create.failure')
      render :new
    end
  end

  private

    def shift_params
      params.require(:shift).permit(:title_date, :comment)
    end
end
