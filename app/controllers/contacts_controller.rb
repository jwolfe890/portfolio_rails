class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end 

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      if @contact.deliver
        flash.new[:error] = nil
      else
        flash.now[:error] = 'Cannot send message'
        render :create
      end 
  end 

end
