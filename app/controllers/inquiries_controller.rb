class InquiriesController < ApplicationController
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
  
  def create
  end
  
  private 
  def inquiry_params
    params.require(:inquiry).permit(:name, :reply_email, :message)
  end
end
