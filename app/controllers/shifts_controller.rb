class ShiftsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shifts = Shift.limit(7).order(created_at: :desc)
  end

  def show
    @shift = Shift.find_by(id: params[:id])
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    # @shift.user_id = current_user.id
    if @shift.save
      flash[:notice] = I18n.t('flash.shifts.create.success')
      redirect_to shifts_path
    else
      flash[:alert] = I18n.t('flash.shifts.create.failure')
      render :new
    end
  end

  def destroy
    @shift = Shift.find_by(id: params[:id])
    # if @shift.user == current_user
    @shift.destroy
    flash[:notice] = I18n.t('flash.shifts.destroy.success')
    # end
    redirect_to shifts_path
  end

  private

  def shift_params
    params.require(:shift).permit(:title_date, :comment)
  end
end
