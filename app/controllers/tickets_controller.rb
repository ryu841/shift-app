class TicketsController < ApplicationController
  def new
  end
  
  def create
    @shift = Shift.find(params[:shift_id])
    # @ticket = @shift.tickets.build(ticket_params)
    # @ticket.status = 'pending'
    @ticket = @shift.tickets.build(ticket_params) do |t|
      t.shift = @shift
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

  private
  def ticket_params
    params.require(:ticket).permit(:comment, :shortfall_id, :user_id).merge(user_id: current_user.id)
  end
end
