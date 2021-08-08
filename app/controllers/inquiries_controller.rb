class InquiriesController < ApplicationController
  before_action :authenticate_user!
  #before_action :inquiry_back, only: [:confirmation, :complete]

  def index
    @inquiry = Inquiry.new
    render :action => 'index'
  end

  def confirmation
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render :action => 'confirmation'
    else
      render :action => 'index'
    end
  end

  def complete
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver
    render :action => 'complete'
  end

  #def inquiry_back
    #@inquiry = Inquiry.new(inquiry_params)
    #if @inquiry.blank?
      #redirect_to inquiries_path
    #end
  #end

  private
  def inquiry_params
    params.require(:inquiry).permit(:name, :reply_email, :message)
  end
end
