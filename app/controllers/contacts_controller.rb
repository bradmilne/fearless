class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
    @name = params[:contact][:name]
    @company = params[:contact][:company]
    @email = params[:contact][:email]
    @phone = params[:contact][:phone]

  	if @contact.save
      ContactMailer.notify_sales(@name,@company, @email, @phone).deliver
  		redirect_to new_contact_path 
  		flash[:success] =  "Thank you for contacting us. We will be in touch shortly."
    else
    	render 'contacts/new'
    	flash[:error] = "Some of your information wasn't correct - please try again."
    end
  end

  def contact_params
  	params.require(:contact).permit(:name, :email, :phone, :company)
  end
end
