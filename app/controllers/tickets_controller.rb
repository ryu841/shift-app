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
      flash[:notice] = "参加申請が送信されました"
      redirect_to shift_path(params[:shift_id])
    else
      flash[:notice] = "参加申請に失敗しました"
      redirect_to shift_path(params[:shift_id])
  end
end
