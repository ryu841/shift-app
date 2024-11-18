class TicketsController < ApplicationController
  before_action :set_ticket, only: [:approve, :reject]
  before_action :set_shift, only: [:create, :reject, :destroy, :create]

  def index
    @shifts = Shift.includes(:tickets).all
    @tickets = @shifts.flat_map(&:tickets)
  end

  def new
  end
  
  def create
    # @ticket = @shift.tickets.build(ticket_params)
    @ticket = @shift.tickets.build(ticket_params) do |t|
      t.shift = @shift
      t.comment = params[:ticket][:comment]
    end
    @ticket.status = 'pending'
    if @ticket.save
      flash[:notice] = I18n.t('flash.tickets.create.success')
      redirect_to shift_path(params[:shift_id])
    else
      flash[:alert] = I18n.t('flash.tickets.create.failure')
      redirect_to shift_path(params[:shift_id])
    end
  end

  def destroy
    ticket = current_user.tickets.find_by!(shift_id: params[:shift_id], id: params[:id])
    ticket.destroy!

    case params[:type]
    when "cancel"
      redirect_to shift_path(params[:shift_id])
      flash[:notice] = I18n.t('flash.tickets.cansel.success')
    when "delete"
      redirect_to shifts_path
      flash[:notice] = I18n.t('flash.tickets.delete.success')
    else
      flash[:alert] = I18n.t('flash.tickets.unknown_action')
      redirect_to root_path
    end
  end

  def approve
    @ticket.update!(status: 'approved')
    flash[:notice] = I18n.t('flash.tickets.approve.success')
    redirect_to shift_tickets_path(@ticket.shift_id)
  end

  def reject
    @ticket.update!(status: 'rejected')
    flash[:notice] = I18n.t('flash.tickets.reject.success')
    redirect_to shift_tickets_path(@ticket.shift_id)
  end

  def update
    ticket = Ticket.find(params[:id])
    if params[:status] == 'approved'
      ticket.update!(status: 'approved')
      flash[:notice] = I18n.t('flash.tickets.approve.success')
    elsif params[:status] == 'rejected'
      ticket.update!(status: 'rejected')
      flash[:notice] = I18n.t('flash.tickets.reject.success')
    end
    redirect_to tickets_path
  end

  private
  def ticket_params
    params.require(:ticket).permit(:comment, :shortfall_id, :user_id).merge(user_id: current_user.id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_shift
    @shift = Shift.find(params[:shift_id])
  end
end
