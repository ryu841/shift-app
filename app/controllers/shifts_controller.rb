class ShiftsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @shifts = Shift.where(title_date: Time.zone.today..).order(title_date: :asc).page(params[:page]).per(7)
    @allshifts = Shift.all
    @tickets = Ticket.includes(:user)
    @my_tickets = if current_user.present?
                    Ticket.where(user_id: current_user.id).includes(:shortfall, :shift)
                  else
                    []
                  end
  end

  def show
    @shift = Shift.find_by(id: params[:id])
    @shortfalls = @shift.shortfalls
    @ticket = current_user.tickets.find_by(shift: @shift) if current_user
    @tickets = @shift.tickets.includes(:user)
  end

  def new
    @shift = Shift.new
    @shift.shortfalls.build
  end

  def edit
    @shift = Shift.find_by(id: params[:id])
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.admin_id = current_admin['id']
    if @shift.save
      Shift.delete_old_shifts
      flash[:notice] = I18n.t('flash.shifts.create.success')
      redirect_to shifts_path
    else
      @shift.shortfalls.build if @shift.shortfalls.empty?
      flash[:alert] = I18n.t('flash.shifts.create.failure')
      render :new
    end
  end

  def update
    @shift = Shift.find_by(id: params[:id])
    if @shift.update(shift_params)
      @shift.reload
      redirect_to shift_path(@shift)
      flash[:notice] = I18n.t('flash.shifts.update.success')
    else
      flash[:alert] = I18n.t('flash.shifts.update.failure')
      render :edit
    end
  end

  def destroy
    @shift = Shift.find_by(id: params[:id])
    @shift.shortfalls.destroy_all
    if @shift.admin_id == current_admin['id']
      @shift.destroy
      flash[:notice] = I18n.t('flash.shifts.destroy.success')
    else
      flash[:alert] = I18n.t('flash.shifts.destroy.failure')
    end
    redirect_to shifts_path
  end

  private

  def shift_params
    params.require(:shift).permit(:title_date, :comment,
                                  shortfalls_attributes: [:id, :start_time, :end_time, :require_count, :_destroy])
  end
end
