class TicketsController < ApplicationController
  def new
  end
  
  def create
    shift = Shift.find(params[:shift_id])
    @ticket.status = 'pending'
    @ticket = current_user.tickets.build do |t|
      t.shift = shift
      t.comment = params[:ticket][:comment]
    end
    if @ticket.save
      flash[:notice] = I18n.t('flash.tickets.create.success')
      redirect_to shift_path(params[:shift_id])
    else
      flash[:alert] = I18n.t('flash.tickets.create.failure')
      redirect_to shift_path(params[:shift_id])
  end
end
